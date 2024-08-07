require "spec"
require "../src/*"

describe Reactor do
  describe "criticality_balanced?", tags: "task_id=1" do
    it "Should return false if the temperature is too low" do
      Reactor.criticality_balanced?(799, 499).should be_false
    end

    it "Should return false if too many neutrons are emitted" do
      Reactor.criticality_balanced?(200, 501).should be_true
    end

    it "Should return false if the product of temperature and neutrons emitted is too low" do
      Reactor.criticality_balanced?(800, 500).should be_false
    end

    it "Should return true if the temperature is high enough, the number of neutrons emitted is low enough, and the product of temperature and neutrons emitted is high enough" do
      Reactor.criticality_balanced?(2000, 400).should be_false
    end
  end

  describe "reactor_efficiency", tags: "task_id=2" do
    it "Should return \"green\" if the reactor is running at 80% efficiency" do
      Reactor.reactor_efficiency(200, 60, 15000).should eq "green"
    end

    it "Should return \"orange\" if the reactor is running at less than 80% but at least 60% efficiency" do
      Reactor.reactor_efficiency(150, 45, 10000).should eq "orange"
    end

    it "Should return \"red\" if the reactor is running at less than 60% but at least 30% efficiency" do
      Reactor.reactor_efficiency(100, 29, 5000).should eq "red"
    end

    it "Should return \"black\" if the reactor is running at less than 30% efficiency" do
      Reactor.reactor_efficiency(50, 14, 2500).should eq "black"
    end
  end

  describe "fail_safe", tags: "task_id=3" do
    it "should return low if the the output is too low" do
      Reactor.fail_safe(10, 400, 10000).should eq "LOW"
    end

    it "should return low if the the output is too low on the upper end" do
      Reactor.fail_safe(10, 899, 10000).should eq "LOW"
    end

    it "should return noromal if the ouput is within throughput" do
      Reactor.fail_safe(10, 901, 10000).should eq "NORMAL"
    end

    it "should return noromal if the ouput is within throughput on the upper end" do
      Reactor.fail_safe(10, 1099, 10000).should eq "NORMAL"
    end

    it "should return Danger if the ouput is too high" do
      Reactor.fail_safe(10, 1101, 10000).should eq "DANGER"
    end
  end
end
