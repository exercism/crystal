class TaskHandler
  def initialize(tasks : Array(String))
    raise "Please implement the TaskHandler#initialize method"
  end

  def update_task_condition_logic(&block : Int32 -> Bool)
    raise "Please implement the TaskHandler#update_task_condition_logic method"
  end

  def execute(priority : Int32)
    raise "Please implement the TaskHandler#execute method"
  end
end
