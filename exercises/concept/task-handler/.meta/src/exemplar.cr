class TaskHandler
  def initialize(tasks : Array(String))
    @tasks = tasks
    @task_condition_logic = ->(priority : Int32) : Bool { priority >= 0 }
  end

  def update_task_condition_logic(&block : Int32 -> Bool)
    @task_condition_logic = block
  end

  def execute(priority : Int32)
    if @task_condition_logic.call(priority)
      completed = @tasks.shift
      "Completed #{completed}"
    else
      "Could not complete #{@tasks[0]}"
    end
  end
end
