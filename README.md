# xCrystal [![Build Status](https://travis-ci.org/exercism/xcrystal.svg?branch=master)](https://travis-ci.org/exercism/xcrystal)

Exercism problems in Crystal.

## The Tests

### All Assignments

Run all assignments with:
```bash
$ make test
```

### Single Assignment

Run single assignments with:
```bash
$ make test-assignment ASSIGNMENT=test-folder-name
```

## The Test Generator

### Creating a New Generator

Navigate to `src/generator/exercises` and create a new generator file (i.e. `hello_world.cr`).

This file should contain 2 classes:
* An exercise generator which must inherit from the ExerciseGenerator class.
* A test case class which inherits from ExerciseTestCase.

The x-common repo must reside at the same level as the developer's crystal directory, and must contain a canonical-data.json file for the given exercise.

### Running the Generator

From within the xcrystal directory:
```bash
$ crystal src/generator/generate.cr hello-world
```

Or build a binary:
```bash
$ make build_generator
$ bin/generate hello-world
```

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

## License

The MIT License (MIT)

Copyright (c) 2016 Katrina Owen, _@kytrinyx.com

### Crystal logo
The Crystal logo is assumed to be owned by Manas SA. It appears to be released under version 2.0 of the Apache license, along with the Crystal codebase. It may also fall within the public domain, since the version we are using is a geometric shape. We have cropped it for use on Exercism.
