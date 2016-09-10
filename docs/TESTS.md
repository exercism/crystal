## Running Tests

Execute the tests with:

```bash
$ crystal spec test_spec.cr
```

In each test suite all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by changing `pending` to `it`.

## Crystal Format

Before submitting, it's recommended that you run `crystal tool format` on your solution.

You can format everything in your current directory with:

```bash
$ crystal tool format ./
```

Or you can selectively format files with:

```bash
$ crystal tool format ./<path>/<to>/<file>
```
