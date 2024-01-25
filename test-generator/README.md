# Generator

Last Updated: 2023/04/5

The generator is a powerful tool that can be used to generate tests for exercises based on the canonical data.
The generator is written in Crystal and is located in the `bin` directory.

## How to use the generator

### Things to do before running the generator

Before running the generator you have to make sure a couple of files are in place.

1. `tests.toml` file

It is located under the `.meta` folder for each exercise.
The toml file is used to configure which exercises are generated and which are not.
Since the generator grabs all the data from the canonical data, so does this enable new tests that won't automatically be merged in.
Instead so does new tests have to be added to the toml file before they show up in the test file.

If there is a test that isn't needed or something that doesn't fit Crystal you can remove it from the toml file.
By writing after the test name `include = false` and it will be skipped when generating the test file.

2. `config.json` file, located in the root of the track

The generator makes sure that the exercise is in the config.json so you need to add it there before running the generator.

3. `spec` directory

The generator will create a spec file for each exercise, so you need to make sure that the spec directory is in place.
Although there don't have to be any files in the directory, since the script will create one for you.
If it is a file already so will the generator overwrite it.

#### Things to note

The script which grabs info from the toml file is quite sensitive, writing the toml file in an incorrect way can brick the generator.

Here are some examples of how you should **NOT** work with the toml file.

Make sure that the uuid is the only thing inside of `[uuid]`, if there is, for example, an extra space so would that break it.
Here is an example

```toml
# This would break it since it is an extra space between uuid and `]`
[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4 ]
# This would break it since it is an extra space between uuid and `[`
[ 1e22cceb-c5e4-4562-9afe-aef07ad1eaf4]
```

The script won't care if you write `include = true` since if it sees the uuid it will always take it as long as `include = false` is not written.
The script will not work if anything is misspelled, although the part which gets `include = false` doesn't care if it gets an extra space or not.

**NOTE:**
You are also **NOT** allowed to write `include = false` more than once after each uuid.
Since that can lead to errors in the generator.

Bad way:

```toml
[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4]
description = "basic"
include = false
include = false
```

Good way:

```toml
[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4]
description = "basic"
include = false
```

### Template

The generator uses a template file to generate the test file.
The template is located under the `.meta` for each exercise.

This template has to be manually written for each exercise.
The goal although is to make it so that you only have to write the template once and then it will be able to be used to generate new tests.

The template file is written in [Embedded Crystal(ECR)][ecr], it is very similar to ERB(Embedded Ruby) for people who have worked with that.
ECR enables you to write Crystal code inside of the template file.
It also means that the templates can be highly customizable since you can write any Crystal code you want.

When writing the template file it is recommended to look at already existing template files to get a better understanding of how it works.
The template is getting a slightly modified version of the canonical data, so you can check out the [canonical data][canonical data] to see the data structure.
The modification is that the cases which are not included in the toml file will be removed from the data structure.

When writing the template so is it a special tool that can help with giving `it` and `pending` tags for tests.
You simply have to call the `status` method.
It will return either `it` or `pending` depending on if it is the first test case or not.

Here is an example:

```crystal
<%= status()%>
<%= status()%>
<%= status()%>
```

result:

```
it
pending
pending
```

### The Test Generator

If all the earlier steps are done so can you run the generator.
To run the generator you need to have a working crystal installation.
The generator is located in the `bin` directory and is called `generator.sh`.

To run the generator so do you have to be in the root directory and run the following command:

```shell
./bin/generator.sh <exercise_slug>
```

Where `<exercise_slug>` is the same name as the slug name which is located in the `config.json` file.

### Errors and warnings

The generator will give you errors and warnings if something is wrong.
That includes if the exercise is not in the `config.json` file, if the exercise is not in the toml file, or if the template file is missing.
Also if it has a problem getting the `canonical-data.json` file so will it give you an error.
The generator also uses a formatter which will give you errors if the generated file is not formatted correctly.
The file will still be generated even if formatter gives errors, therefore can you check the file and see what is wrong and fix it in the template.

## How the generator works (for maintainers)

### Info

This section is for maintainers who want to know how the generator works and the knowledge needed to be able to do modifications to it.
If you are not a maintainer or exercism staff so can you skip this section.
Doing modifications to the generator as a contributor is not recommended since it can break the generator for all the exercises.
Therefore so is it recommended to contact the maintainers of the track if you want to do modifications to the generator.
Failure to do so can lead to your PR being closed without explanation.

### How the generator works

The generator is written in Crystal and is located in the `bin` directory.
It is initialized in the generator file which is located in the `bin` directory.
From there it is calling the GeneratorHelp class which is located in the `bin` directory.

From there is the method `check_config` called it checks so the exercise given exists in the `config.json` file.
If it doesn't so will it raise an error.
After that is `get_remote_files`, it will get the `canonical-data.json` for the exercise and gives errors if it can't find it.

After that is `toml` called it will get the toml file and it goes through each line and check if a line starts with `[` and ends with `]` if it does so will it att the uuid to an array.
If a line includes `include = false` it will remove the last uuid from the array.
Meaning writing multiple `include = false` will remove multiple uuids from the array.

Then is that array with uuid feed into the `remove_tests` method.
The method will go through each case and check if the uuid from the case is in the array.
If it is not so will it remove the case from the json file.
After that, it will return the json variable.

After that is the template file read and given to the ECR template engine with the json variable.
The template engine will then generate the test file.

After that is the test file written to the `spec` directory, and then it will format the file with `crystal tool format`.
After the file is formatted so will another formatter be run which is written in-house.

That will look for places where an `array`, `hash`, or `tuple` is written on one line and then it will format it to be on multiple lines.
This is done to make long collections easier to read.
It goes through each character on the line and after a specific length it will check if the next character is a `,` and that is not under a nested structure.
If it is so will it add a new line by adding `\n`.
After that is the new line returned and then will the file be formatted again with `crystal tool format`.

There is also an extra option when running the generator which is being able to specify where the generated file should be written.
This is by adding the path as a second argument when running the generator.

[ecr]: https://crystal-lang.org/api/latest/ECR.html
[canonical data]: https://github.com/exercism/problem-specifications
