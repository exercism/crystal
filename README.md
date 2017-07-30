# Crystal [![Build Status](https://travis-ci.org/exercism/crystal.svg?branch=master)](https://travis-ci.org/exercism/crystal)

Exercism problems in Crystal.

## The Tests

### All Exercises

Run all Exercises with:
```bash
$ make test
```

### Single Exercises

Run single Exercises with:
```bash
$ make test-exercise EXERCISE=exercise-name
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
If the local x-common repo doesn't exist, a request is made to GitHub to download (and cache) the test's canonical-data.json file.

### Running the Generator for a Single Exercise

From within the crystal directory:
```bash
$ crystal generator/generator.cr hello-world
```

Or build a binary and use that:
```bash
$ make build-generator
$ make generate-exercise GENERATOR=hello-world
```

### Running (or Re-running) the Generator for All Exercises

This can be good for refreshing the tests when changes are made to the x-common repo. Or for testing the full functionality of the test generator.

```bash
$ make generate-exercises
```

### To Test the Generator

```bash
$ make test-generator
```

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)


### Crystal logo
The Crystal logo is assumed to be owned by Manas SA. It appears to be released under version 2.0 of the Apache license, along with the Crystal codebase. It may also fall within the public domain, since the version we are using is a geometric shape. We have cropped it for use on Exercism.
