# Hints

## General

- To access and define instance variables you write `@` followed by the name of the variable.

## 1. Initialize `TaskHandler`

- To create a `Proc` use the `-> (args) { block }` syntax.
- When a `Proc` is defined for an instance variable, it needs to be explicitly typed.
  This can be done by adding `: Proc(<arg_type>, <return_type>)` after the variable name.
  Or `-> (arg_1 : <arg_type>) : <return_type> { block }` syntax.
- The `Proc` should compare if the argument is greater than or equal to 0.

## 2. Update the task condition logic

- The method should take a block as an argument and assign it to the `@task_condition_logic` instance variable.

## 3. Execute the next task

- To execute a `Proc` you can use the `call` method which accepts the arguments for the proc.
