# assignments
ASSIGNMENT ?= ""
IGNOREDIRS := "^(\.git|docs)$$"
EXERCISESDIR ?= "exercises"
ASSIGNMENTS = $(shell find exercises -maxdepth 1 -mindepth 1 -type d | cut -d'/' -f2 | sort | grep -Ev $(IGNOREDIRS))

# output directories
TMPDIR ?= "/tmp"
OUTDIR := $(shell mktemp -d "$(TMPDIR)/$(ASSIGNMENT).XXXXXXXXXX")

# language specific config (tweakable per language)
FILEEXT := "cr"
EXAMPLE := "example.$(FILEEXT)"
TESTNAME := "$(subst -,_,$(ASSIGNMENT))"
SPECFILE := "$(TESTNAME)_spec.$(FILEEXT)"
TESTFILE := "$(TESTNAME).$(FILEEXT)"

test-assignment:
	@echo "running tests for: $(ASSIGNMENT)"
	@cp $(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECFILE) $(OUTDIR)
	@cp $(EXERCISESDIR)/$(ASSIGNMENT)/$(EXAMPLE) $(OUTDIR)/$(TESTFILE)
	@sed 's/pending/it/g' $(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECFILE) > $(OUTDIR)/$(SPECFILE)
	@cd $(OUTDIR) && crystal spec $(SPECFILE)
	crystal tool format --check $(EXERCISESDIR)/$(ASSIGNMENT)
	@printf "\n"

test:
	@for assignment in $(ASSIGNMENTS); do ASSIGNMENT=$$assignment $(MAKE) -s test-assignment || exit 1; done
