EXERCISE ?= ""
IGNOREDIRS := "^(\.git|.crystal|docs|bin|img|script)$$"
EXERCISESDIR ?= "exercises"
EXERCISES = $(shell find exercises -maxdepth 1 -mindepth 1 -type d | cut -d'/' -f2 | sort | grep -Ev $(IGNOREDIRS))

FILEEXT = "cr"
SPECDIR = "spec"
EXERCISENAME := "$(subst -,_,$(EXERCISE))"
EXERCISESPECDIR := $(EXERCISESDIR)/$(EXERCISE)/$(SPECDIR)
SPECFILE := "$(EXERCISENAME)_spec.$(FILEEXT)"
SUPERSPECFILE := "$(SPECFILE).super"
TMPSPECFILE := "$(SPECFILE).tmp"

GENERATORDIR ?= "generator"
GENERATORSDIR := $(GENERATORDIR)/src/generators
GENERATORS = $(shell find $(GENERATORSDIR) -type f | cut -d '/' -f 4 | cut -d '.' -f 1 | sed 's/_/-/g')

test-exercise:
	@echo "running formatting check for: $(EXERCISE)"
	@crystal tool format --check $(EXERCISESDIR)/$(EXERCISE)
	@echo "moving files around"
	@sed 's/pending/it/g' $(EXERCISESPECDIR)/$(SPECFILE) > $(EXERCISESPECDIR)/$(TMPSPECFILE)
	@mv $(EXERCISESPECDIR)/$(SPECFILE) $(EXERCISESPECDIR)/$(SUPERSPECFILE)
	@mv $(EXERCISESPECDIR)/$(TMPSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@echo "running tests for: $(EXERCISE)"
	@cd $(EXERCISESDIR)/$(EXERCISE) && crystal spec
	@rm $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISESPECDIR)/$(SUPERSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@printf "\n"

test-exercises:
	@for exercise in $(EXERCISES); do EXERCISE=$$exercise $(MAKE) -s test-exercise || exit 1; done

build-generator:
	@crystal build $(GENERATORDIR)/generator.$(FILEEXT) -o generator/bin/generator

generate-exercise:
	@echo "generating spec file for generator: $(GENERATOR)"
	@generator/bin/generator $(GENERATOR)

generate-exercises:
	@for generator in $(GENERATORS); do GENERATOR=$$generator $(MAKE) -s generate-exercise || exit 1; done

test-generator:
	@echo "running generator tests"
	@cd $(GENERATORDIR) && crystal deps && crystal spec

test:
	@echo "running all the tests"
	@$(MAKE) -s test-exercises
	@$(MAKE) -s test-generator
