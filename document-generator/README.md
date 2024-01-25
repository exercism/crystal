# Crystal's Documentation Generator

⚠️ This tool is a work in progress, it is in production on the Crystal track but breaking changes **WILL** ocour without warning ⚠️

This is a documentation generator built 100% using Crystal.
It purpose is to create a [DSL][dsl] for creating syllabus docs for Exercism.
This tooling is not intended to be used outside of Exercism.

## Goal

The goal of this tool is to create a DSL that can be used to create syllabus docs for Exercism, in a more efficent way and with a system that ensures that the docs are synced.
The tool is designed to be able to create docs for any language track on Exercism and it is possible to create an excutable to make Crystal not a requirement for the end user.
Its main purpose is to be able to have a single source of text and then through templating being able to create other docs like the introduction.
This tool differs from the already existing documentation generator bundled with configlet in that it will have more features and be more flexible and thereby allow for more complex docs to be created.

## Installation

### From source

To install this tool from source you need to have Crystal installed.
Then you can run the following command:

```bash
cd document-generator
crystal build ./src/cli.cr -o ../bin/document-generator
```

## Usage

### Using the CLI

```bash
# To get all the available commands
./bin/document-generator --help

# To generate all docs
./bin/document-generator --all

# To generate docs for a specific concept
./bin/document-generator -d <concept_name>

# To generate docs for a specific exercise
./bin/document-generator -e <exercise_name>
```

### Writing templates

This library uses a DSL to write templates, but as of writing this so is the dsl rather limited and is subject to change.
The DSL is only able to grab text from the `about.md` files thereby all the text that is used in the docs should be put in the `about.md` files.
The template should be put under the `.meta` folder with the name `template.md`.

To include the complete content of a concept, use the `{% $concept %}` syntax, the concepts name needs to have a `$` in front of it to highlight that it is a variable and not a command.

```markdown
{% $strings %}
```

To include a specific header from a concept, use the `{% $concept.header %}` syntax, the concept and the header needs to be separated by a `.`.
If the header has a space in it, then the header needs to be sorounded by `""`.

```markdown
{% $strings.introduction %}
{% $strings."about strings" %}
```

To exclude a specific header from a concept, use the `{% $concept exclude $concept.header %}`, allternativly `exclude` have a shorthand which is `\`.

```markdown
{% $strings exclude $strings.introduction %}
{% $strings \ $strings."about strings" %}
```

## Roadmap

- [x] Create a DSL for creating syllabus docs
- [x] Create a CLI to work with the DSL
- [x] Automatic link handling system
- [x] Add a CI script to run tests on the generated docs
- [x] Add github output when fail
- [ ] Fully extensive test suite
- [ ] Fully documented code & Usage
- [ ] Add support to exclude multiple heading easier from the docs
- [ ] Add support to exclude all children from a heading
- [ ] Add support to reuse the introduction docs
- [ ] Add support for changing `#` level of headings
- [ ] Add syntax when working inside certain concept to refer to that concept
