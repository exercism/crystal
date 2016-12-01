EXERCISE ?= ""
IGNOREDIRS := "^(\.git|.crystal|docs|bin|img|script)$$"
EXERCISESDIR ?= "exercises"
GENERATORDIR ?= "src/generator"
EXERCISES = $(shell find exercises -maxdepth 1 -mindepth 1 -type d | cut -d'/' -f2 | sort | grep -Ev $(IGNOREDIRS))

FILEEXT = "cr"
SPECDIR = "spec"
EXERCISENAME := "$(subst -,_,$(EXERCISE))"
EXERCISEDIR := $(EXERCISESDIR)/$(EXERCISE)
EXERCISESPECDIR := $(EXERCISEDIR)/$(SPECDIR)
SPECFILE := "$(EXERCISENAME)_spec.$(FILEEXT)"
SUPERTMPSPECFILE := "$(SPECFILE).super.tmp"
TMPSPECFILE := "$(SPECFILE).tmp"

test-exercise:
	@echo "running formatting check for: $(EXERCISE)"
	@crystal tool format --check $(EXERCISESDIR)/$(EXERCISE)
	@sed 's/pending/it/g' $(EXERCISESPECDIR)/$(SPECFILE) > $(EXERCISESPECDIR)/$(TMPSPECFILE)
	@mv $(EXERCISESPECDIR)/$(SPECFILE) $(EXERCISESPECDIR)/$(SUPERTMPSPECFILE)
	@mv $(EXERCISESPECDIR)/$(TMPSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@echo "running tests for: $(EXERCISE)"
	@cd $(EXERCISESDIR)/$(EXERCISE) && crystal spec
	@rm $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISESPECDIR)/$(SUPERTMPSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@printf "\n"

test:
	@for exercise in $(EXERCISES); do EXERCISE=$$exercise $(MAKE) -s test-exercise || exit 1; done
	@echo "running generator tests"
	@cd $(GENERATORDIR) && crystal spec

build_generator:
	@crystal build $(GENERATORDIR)/generate.$(FILEEXT) -o bin/generate
