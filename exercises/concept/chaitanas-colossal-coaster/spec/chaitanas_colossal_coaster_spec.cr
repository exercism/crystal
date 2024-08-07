require "spec"
require "../src/*"

describe ColossalCoaster do
  describe "add_to_queue", tags: "task_id=1" do
    it "should add person correctly to normal queue" do
      expected = ["RobotGuy", "WW", "HawkEye"]
      ColossalCoaster.add_to_queue(["Tony", "Bruce"], ["RobotGuy", "WW"], 0, "HawkEye").should eq expected
    end

    it "should add person correctly to express queue" do
      expected = ["Tony", "Bruce", "RichieRich"]
      ColossalCoaster.add_to_queue(["Tony", "Bruce"], ["RobotGuy", "WW"], 1, "RichieRich").should eq expected
    end
  end

  describe "find_my_friend", tags: "task_id=1" do
    it "should find person in the start of the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.find_my_friend(queue, "Natasha").should eq 0
    end

    it "should find person in the middle of the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.find_my_friend(queue, "Tchalla").should eq 2
    end

    it "should find person in the end of the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.find_my_friend(queue, "Rocket").should eq 4
    end
  end

  describe "add_with_friends", tags: "task_id=1" do
    it "should add person to the start of the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Bucky", "Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.add_with_friends(queue, "Natasha", "Bucky").should eq expected
    end

    it "should add person to the middle of the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Steve", "Tchalla", "Bucky", "Wanda", "Rocket"]
      ColossalCoaster.add_with_friends(queue, "Wanda", "Bucky").should eq expected
    end

    it "should add person to the end of the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Steve", "Tchalla", "Wanda", "Bucky", "Rocket"]
      ColossalCoaster.add_with_friends(queue, "Rocket", "Bucky").should eq expected
    end
  end

  describe "remove_from_queue", tags: "task_id=1" do
    it "remove Steve in the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.remove_from_queue(queue, "Steve").should eq expected
    end

    it "remove Natasha in the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Steve", "Tchalla", "Wanda", "Rocket"]
      ColossalCoaster.remove_from_queue(queue, "Natasha").should eq expected
    end

    it "remove Rocket in the queue" do
      queue = ["Natasha", "Steve", "Tchalla", "Wanda", "Rocket"]
      expected = ["Natasha", "Steve", "Tchalla", "Wanda"]
      ColossalCoaster.remove_from_queue(queue, "Rocket").should eq expected
    end
  end

  describe "sorted_queue", tags: "task_id=1" do
    it "should sort the queue correctly" do
      queue = ["Steve", "Ultron", "Natasha", "Rocket"]
      expected = ["Natasha", "Rocket", "Steve", "Ultron"]
      ColossalCoaster.sorted_queue(queue).should eq expected
    end

    it "should sort another queue correctly" do
      queue = ["Steve", "Ultron", "Natasha", "Rocket", "Tchalla"]
      expected = ["Natasha", "Rocket", "Steve", "Tchalla", "Ultron"]
      ColossalCoaster.sorted_queue(queue).should eq expected
    end
  end
end
