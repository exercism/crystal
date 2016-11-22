ASSIGNMENT ?= ""
IGNOREDIRS := "^(\.git|.crystal|docs|bin|img|script)$$"
EXERCISESDIR ?= "exercises"
GENERATORDIR ?= "src/generator"
ASSIGNMENTS = $(shell find exercises -maxdepth 1 -mindepth 1 -type d | cut -d'/' -f2 | sort | grep -Ev $(IGNOREDIRS))

FILEEXT := "cr"
SPECDIR = "spec"
ASSIGNMENTNAME := "$(subst -,_,$(ASSIGNMENT))"
EXERCISESPECDIR := $(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECDIR)
SPECFILE := "$(ASSIGNMENTNAME)_spec.$(FILEEXT)"
SUPERSPECFILE := "$(SPECFILE).super"
TMPSPECFILE := "$(SPECFILE).tmp"

test-assignment:
	@echo "running formatting check for: $(ASSIGNMENT)"
	@crystal tool format --check $(EXERCISESDIR)/$(ASSIGNMENT)
	@echo "moving files around"
	@sed 's/pending/it/g' $(EXERCISESPECDIR)/$(SPECFILE) > $(EXERCISESPECDIR)/$(TMPSPECFILE)
	@mv $(EXERCISESPECDIR)/$(SPECFILE) $(EXERCISESPECDIR)/$(SUPERSPECFILE)
	@mv $(EXERCISESPECDIR)/$(TMPSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@echo "running tests for: $(ASSIGNMENT)"
	@cd $(EXERCISESDIR)/$(ASSIGNMENT) && crystal spec
	@rm $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISESPECDIR)/$(SUPERSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@printf "\n"

test:
	@for assignment in $(ASSIGNMENTS); do ASSIGNMENT=$$assignment $(MAKE) -s test-assignment || exit 1; done
	@echo "running generator tests"
	@cd $(GENERATORDIR) && crystal spec

build_generator:
	@crystal build $(GENERATORDIR)/generate.$(FILEEXT) -o bin/generate
