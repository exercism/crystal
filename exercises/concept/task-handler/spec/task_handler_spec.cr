require "spec"
require "../src/*"

def check_proc(proc, num)
  proc.call(num).should eq true
  proc.call(num - 1).should eq false
end

describe TaskHandler do
  describe "initialize" do
    it "should initialize with a task" do
      handler = TaskHandler.new(["task1", "task2"])
      handler.@tasks.should eq ["task1", "task2"]
      handler.@task_condition_logic.should be_a Proc(Int32, Bool)
      check_proc(handler.@task_condition_logic, 0)
    end
  end

  describe "update_task_condition_logic" do
    it "should update the task condition logic" do
      handler = TaskHandler.new(["task1", "task2"])
      handler.update_task_condition_logic { |priority| priority > 2 }
      check_proc(handler.@task_condition_logic, 3)
    end

    it "should be able to update the task condition logic multiple times" do
      handler = TaskHandler.new(["task1", "task2"])
      handler.update_task_condition_logic { |priority| priority > 2 }
      check_proc(handler.@task_condition_logic, 3)
      handler.update_task_condition_logic { |priority| priority > 0 }
      check_proc(handler.@task_condition_logic, 1)
    end
  end

  describe "execute" do
    it "should add a task to the task list" do
      handler = TaskHandler.new(["task1", "task2"])
      handler.execute(1).should eq "Completed task1"
    end

    it "should be able to execute multiple tasks" do
      handler = TaskHandler.new(["task1", "task2"])
      handler.execute(1).should eq "Completed task1"
      handler.execute(1).should eq "Completed task2"
    end

    it "should not run if the task condition logic is not met" do
      handler = TaskHandler.new(["task1", "task2"])
      handler.update_task_condition_logic { |priority| priority > 2 }
      handler.execute(2).should eq "Could not complete task1"
    end

    it "should be able to update the condition after one task is completed" do
      handler = TaskHandler.new(["task1", "task2"])
      handler.execute(1).should eq "Completed task1"
      handler.update_task_condition_logic { |priority| priority > 2 }
      handler.execute(1).should eq "Could not complete task2"
    end
  end
end
