# Crystal [![Build Status](https://github.com/exercism/crystal/workflows/Tests/badge.svg?branch=main)](https://github.com/exercism/crystal/actions?query=workflow%3ATests+branch%3Amain)

Exercism problems in Crystal.

## The Tests

### All Exercises

Test all exercises with:
```shell
make test-exercises
```

### Single Exercises

Test single exercises with:
```shell
make test-exercise EXERCISE=directory/exercise-name

# Example
make test-exercise EXERCISE=practice/acronym
```

## The Test Generator

### Creating a New Generator

Navigate to `generator/src/generators` and create a new generator file (i.e. `hello_world.cr`).

This file should contain 2 classes:
* An exercise generator which must inherit from the ExerciseGenerator class.
* A test case class which inherits from ExerciseTestCase.

There are two ways for the generator to get the test data.

**Local:**
The problem-specifications repo must reside at the same level as the developer's crystal directory, and must contain a canonical-data.json file for the given exercise.

**Remote:**
If the local problem-specifications repo doesn't exist, a request is made to GitHub to download (and cache) the test's canonical-data.json file.

### Running the Generator for a Single Exercise

From within the crystal directory:
```shell
crystal generator/generator.cr hello-world
```

Or build a binary and use that:
```shell
make generate-exercise GENERATOR=hello-world
```

NOTE: A binary version of the generator is built automatically when needed for a given make target, but you may build it manually at any time by running `make build-generator` (or rebuild it with `make clean build-generator`).

### Running (or Re-running) the Generator for All Exercises

This can be used for refreshing the tests when changes are made to the [problem-specifications](https://github.com/exercism/problem-specifications) repo. Or for testing the full functionality of the test generator.

```shell
make generate-exercises
```

### Testing the Generator

```shell
make test-generator
```

### Cleaning up

```shell
make clean
```

Use this command to delete any transient files and build artifacts. This is potentially useful for troubleshooting purposes as it will purge any stale cached files, rebuild the generator when needed and can be combined with other make targets (e.g. `make clean test`).

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)


### Crystal logo
The Crystal logo is assumed to be owned by Manas SA. It appears to be released under version 2.0 of the Apache license, along with the Crystal codebase. It may also fall within the public domain, since the version we are using is a geometric shape. We have cropped it for use on Exercism.
