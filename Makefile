IGNOREDIRS := "^(\.git|.crystal|docs|bin|img|script)$$"
EXERCISESDIR ?= "exercises"
EXERCISES = $(shell find exercises -maxdepth 2 -mindepth 2 -type d | cut -d'/' -f2-3 | sort | grep -Ev $(IGNOREDIRS))

FILEEXT = "cr"
SPECDIR = "spec"
EXERCISENAME := "$(subst -,_,$(notdir $(EXERCISE))")
EXERCISESPECDIR := $(EXERCISESDIR)/$(EXERCISE)/$(SPECDIR)
EXERCISEDIR := $(EXERCISESDIR)/$(EXERCISE)
SPECFILE := "$(EXERCISENAME)_spec.$(FILEEXT)"
SUPERSPECFILE := "$(SPECFILE).super"
TMPSPECFILE := "$(SPECFILE).tmp"

GENERATORDIR ?= generator
GENERATORBIN := $(GENERATORDIR)/bin
GENERATORSDIR := $(GENERATORDIR)/src/generators
GENERATORS = $(shell find $(GENERATORSDIR) -name '*.cr' | xargs -I '{}' basename '{}' .cr | tr _ -)

G_SRCS := $(shell find $(GENERATORDIR) -name "*.cr" -or -name "*.tt" | grep -Ev '(/lib/|/spec/)')

test-exercise:
	@echo "running formatting check for: $(EXERCISE)"
	@crystal tool format --check $(EXERCISESDIR)/$(EXERCISE)
	@echo "moving files around"
	@sed 's/pending/it/g' $(EXERCISESPECDIR)/$(SPECFILE) > $(EXERCISESPECDIR)/$(TMPSPECFILE)
	@mv $(EXERCISESPECDIR)/$(SPECFILE) $(EXERCISESPECDIR)/$(SUPERSPECFILE)
	@mv $(EXERCISESPECDIR)/$(TMPSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISEDIR)/src $(EXERCISEDIR)/notsrc
	@cp -r $(EXERCISEDIR)/.meta/src $(EXERCISEDIR)
	@echo "running tests for: $(EXERCISE)"
	@cd $(EXERCISESDIR)/$(EXERCISE) && crystal spec
	@rm -r $(EXERCISEDIR)/src
	@mv $(EXERCISEDIR)/notsrc $(EXERCISEDIR)/src
	@rm $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISESPECDIR)/$(SUPERSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@printf "\n"

test-exercises:
	@for exercise in $(EXERCISES); do EXERCISE=$$exercise $(MAKE) -s test-exercise || exit 1; done

$(GENERATORBIN):
	@mkdir -p $@

$(GENERATORBIN)/generator: $(G_SRCS) | $(GENERATORBIN)
	@crystal build $(GENERATORDIR)/generator.$(FILEEXT) -o generator/bin/generator

build-generator: $(GENERATORBIN)/generator

generate-exercise: $(GENERATORBIN)/generator
	@echo "generating spec file for generator: $(GENERATOR)"
	@generator/bin/generator $(GENERATOR)

generate-exercises:
	@for generator in $(GENERATORS); do GENERATOR=$$generator $(MAKE) -s generate-exercise || exit 1; done

test-generator:
	@echo "running formatting check for generators"
	@crystal tool format --check $(GENERATORDIR)
	@echo "running generator tests"
	@cd $(GENERATORDIR) && shards install && crystal spec

test:
	@echo "running all the tests"
	@$(MAKE) -s test-exercises
	@$(MAKE) -s test-generator

bin/configlet: bin/fetch-configlet
	./bin/fetch-configlet

ci: bin/configlet
	./bin/configlet lint . --track-id=crystal
	$(MAKE) -s test

clean:
	rm -rf bin/configlet $(addprefix $(GENERATORDIR)/,.shards bin cache lib)

.PHONY: clean ci test test-generator build-generator test-exercise test-exercises generate-exercise generate-exercises
