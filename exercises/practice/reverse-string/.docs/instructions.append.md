# Instructions append

An optional test has been added that tests for possible letters to be any unicode character, not just ASCII alphabetic ones.
These are not accessible from the web editor, but are run by default when executed locally.

To disable these tests, when calling the test command (`crystal spec`), add the following flag: `--tag "~optional"`
