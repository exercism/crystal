# Hello World

The classical introductory exercise. Just say "Hello, World!".

["Hello, World!"](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program) is
the traditional first program for beginning programming in a new language
or environment.

The objectives are simple:

- Write a function that returns the string "Hello, World!".
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise.

## Project Structure

* `src` contains your solution to the exercise
* `spec` contains the tests to run for the exercise

## Running Tests

If you're in the right directory (i.e. the one containing `src` and `spec`), you can run the tests for that exercise by running `crystal spec`:

```bash
$ pwd
/Users/johndoe/Code/exercism/crystal/hello-world

$ ls
GETTING_STARTED.md README.md          spec               src

$ crystal spec
```

This will run all of the test files in the `spec` directory.

In each test file, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by changing `pending` to `it`.

## Submitting Your Solution

Be sure to submit the source file in the `src` directory when submitting your solution:

```bash
$ exercism submit src/hello_world.cr
```


## Setup

Follow the setup instructions for Crystal here:

http://exercism.io/languages/crystal

More help installing can be found here:

http://crystal-lang.org/docs/installation/index.html

## Making the Test Suite Pass

Execute the tests with:

```bash
$ crystal spec
```

In each test suite all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by changing `pending` to `it`.

## Source

This is an exercise to introduce users to using Exercism [http://en.wikipedia.org/wiki/%22Hello,_world!%22_program](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program)

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
