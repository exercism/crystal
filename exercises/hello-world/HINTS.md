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
