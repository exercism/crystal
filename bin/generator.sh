#!/bin/bash

# Used to start the generator

# error prints an error to STDERR and exits.

if [ -z "$1" ] ; then
    echo "usage: $0 exercise-slug "
    exit 1
fi

slug="$1"

if test ! -d "./bin/templates"; then
    mkdir "./bin/templates"
fi

cat "./exercises/practice/${slug}/.meta/test_template.ecr" > "./bin/templates/template.ecr"

if [ $# -eq 2 ] ; then
    crystal ./test-generator/src/generator.cr "${slug}" "${2%/}" || exit 1
else
    crystal ./test-generator/src/generator.cr "${slug}" || exit 1
fi
