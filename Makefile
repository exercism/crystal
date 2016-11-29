EXERCISE ?= ""
IGNOREDIRS := "^(\.git|.crystal|docs|bin|img|script)$$"
EXERCISESDIR ?= "exercises"
GENERATORDIR ?= "src/generator"
EXERCISES = $(shell find exercises -maxdepth 1 -mindepth 1 -type d | cut -d'/' -f2 | sort | grep -Ev $(IGNOREDIRS))

FILEEXT := "cr"
SRCDIR = "src"
SPECDIR = "spec"
EXERCISENAME := "$(subst -,_,$(EXERCISE))"
EXERCISEDIR := $(EXERCISESDIR)/$(EXERCISE)
EXERCISESRCDIR := $(EXERCISEDIR)/$(SRCDIR)
EXERCISESPECDIR := $(EXERCISEDIR)/$(SPECDIR)
EXERCISEFILE := "$(EXERCISENAME).$(FILEEXT)"
TMPEXERCISEFILE := ".$(EXERCISENAME).tmp"
SPECFILE := "$(EXERCISENAME)_spec.$(FILEEXT)"
SUPERSPECFILE := "$(SPECFILE).super"
TMPSPECFILE := "$(SPECFILE).tmp"

test-assignment:
	@echo "running formatting check for: $(EXERCISE)"
	@crystal tool format --check $(EXERCISESDIR)/$(EXERCISE)
	@echo "moving files around"
	@echo $(EXERCISESRCDIR)/$(EXERCISEFILE) $(EXERCISESRCDIR)/$(TMPEXERCISEFILE)
	@mv $(EXERCISESRCDIR)/$(EXERCISEFILE) $(EXERCISESRCDIR)/$(TMPEXERCISEFILE)
	@sed 's/pending/it/g' $(EXERCISESPECDIR)/$(SPECFILE) > $(EXERCISESPECDIR)/$(TMPSPECFILE)
	@mv $(EXERCISESPECDIR)/$(SPECFILE) $(EXERCISESPECDIR)/$(SUPERSPECFILE)
	@mv $(EXERCISESPECDIR)/$(TMPSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@echo "running tests for: $(EXERCISE)"
	@cd $(EXERCISESDIR)/$(EXERCISE) && crystal spec
	@echo "cleaning up"
	@rm $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISESPECDIR)/$(SUPERSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISESRCDIR)/$(TMPEXERCISEFILE) $(EXERCISESRCDIR)/$(EXERCISEFILE)
	@printf "\n"

test:
	@for assignment in $(EXERCISES); do EXERCISE=$$assignment $(MAKE) -s test-assignment || exit 1; done
	@echo "running generator tests"
	@cd $(GENERATORDIR) && crystal spec

build_generator:
	@crystal build $(GENERATORDIR)/generate.$(FILEEXT) -o bin/generate
