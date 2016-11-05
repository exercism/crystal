ASSIGNMENT ?= ""
IGNOREDIRS := "^(\.git|.crystal|docs|bin|img|script)$$"
EXERCISESDIR ?= "exercises"
ASSIGNMENTS = $(shell find exercises -maxdepth 1 -mindepth 1 -type d | cut -d'/' -f2 | sort | grep -Ev $(IGNOREDIRS))

FILEEXT := "cr"
SPECDIR = "spec"
ASSIGNMENTNAME := "$(subst -,_,$(ASSIGNMENT))"
EXERCISESPECDIR := $(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECDIR)
SPECFILE := "$(ASSIGNMENTNAME)_spec.$(FILEEXT)"
TMPSPECFILE := "$(ASSIGNMENTNAME)_spec.$(FILEEXT).tmp"

test-assignment:
	@echo "running formatting check for: $(ASSIGNMENT)"
	@crystal tool format --check $(EXERCISESDIR)/$(ASSIGNMENT)
	@echo "moving files around"
	@sed 's/pending/it/g' $(EXERCISESPECDIR)/$(SPECFILE) > $(EXERCISESPECDIR)/$(TMPSPECFILE)
	@rm $(EXERCISESPECDIR)/$(SPECFILE)
	@mv $(EXERCISESPECDIR)/$(TMPSPECFILE) $(EXERCISESPECDIR)/$(SPECFILE)
	@echo "running tests for: $(ASSIGNMENT)"
	@cd $(EXERCISESDIR)/$(ASSIGNMENT) && crystal spec
	@printf "\n"

test:
	@for assignment in $(ASSIGNMENTS); do ASSIGNMENT=$$assignment $(MAKE) -s test-assignment || exit 1; done
