# Instructions

You are developing a content management system for a website that hosts articles, blog posts, and other written content. 
You have been tasked with implementing a task handler that will process tasks in a priority queue.
The task handler will receive tasks and based on the load on the server and their priority will decide which task to execute next.
If the server is under heavy load, then the priority number has to be higher for the task to be executed.
The server will dynamically change the load based on the load.

## 1. Initialize `TaskHandler`

The TaskHandler needs to be initialized with a queue and a default load_level.

Implement the initializer of the class `TaskHandler` that takes an `Array` of `String`s of the tasks names as an argument and storing it in an instance variable called `@tasks`.
The initializer should also create the instance variable `@task_condition_logic` that stores a `Proc` that takes an `Int32` and returns true if the argument is equal to or greater than the 0 and false if it is less than 0.

```crystal
task_handler = TaskHandler.new(["task1", "task2", "task3"])
# => #<TaskHandler:0x7fd8d4cfbf00 @tasks=["task1", "task2", "task3"], @task_condition_logic=#<Proc(Int32, Bool):0x562536a4a330>>
```

## 2. Update the task condition logic

The server has to be able to update the task condition logic based on the load of the server.

Implement the method `TaskHandler#update_task_condition_logic` that takes a block as an argument and the block should be stored in the instance variable `@task_condition_logic`.

```crystal
task_handler = TaskHandler.new(["task1", "task2", "task3"])
task_handler.update_task_condition_logic { |load| load > 1 }
# => #<TaskHandler:0x7f068118cf00 @tasks=["task1", "task2", "task3"], @task_condition_logic=#<Proc(Int32, Bool):0x562df99d0370>>
```

## 3. Execute the next task

The server has to be able to execute the next task in the queue.

The first task in the `@tasks` array is the next task to be executed.
The task should be executed if the priority level of the task given returns true when passed to the `@task_condition_logic` proc.

It shall return messages based on if the task was executed or not.
If the task was executed it should return: `"Completed <task>"`.
If the task was not executed it should return: `"Could not complete <task>"`.

If the task was executed it should be removed from the `@tasks` array.

Implement the method `TaskHandler#execute_next_task` that takes the priority level as `Int32` of the next task as an argument and returns a `String` based on if the task was executed or not.

```crystal
task_handler = TaskHandler.new(["task1", "task2", "task3"])
task_handler.update_task_condition_logic { |load| load > 1 }
task_handler.execute_next_task(2)
# => "Completed task1"

task_handler.execute_next_task(1)
# => "Could not complete task2"
```
