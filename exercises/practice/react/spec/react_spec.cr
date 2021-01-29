require "spec"
require "../src/*"

describe React::InputCell do
  it "have a value" do
    input = React::InputCell.new(10)
    input.value.should eq 10
  end

  it "can have values set" do
    input = React::InputCell.new(4)
    input.value = 20
    input.value.should eq 20
  end
end

describe React::ComputeCell do
  it "calculate initial value" do
    input = React::InputCell.new(1)
    output = React::ComputeCell.new(input) { |v| v + 1 }
    output.value.should eq 2
  end

  it "take input in the right order" do
    one = React::InputCell.new(1)
    two = React::InputCell.new(2)
    output = React::ComputeCell.new(one, two) { |v1, v2| v1 + v2 * 10 }
    output.value.should eq 21
  end

  it "update value when dependencies are changed" do
    one = React::InputCell.new(1)
    output = React::ComputeCell.new(one) { |v| v + 1 }
    one.value = 3
    output.value.should eq 4
  end

  it "can depend on other compute cells" do
    input = React::InputCell.new(1)
    times_two = React::ComputeCell.new(input) { |v| v * 2 }
    times_thirty = React::ComputeCell.new(input) { |v| v * 30 }
    output = React::ComputeCell.new(times_two, times_thirty) { |v1, v2| v1 + v2 }
    output.value.should eq 32
    input.value = 3
    output.value.should eq 96
  end

  describe "callbacks" do
    it "are fired on change" do
      values = [] of Int32
      input = React::InputCell.new(1)
      output = React::ComputeCell.new(input) { |v| v + 1 }
      output.add_callback { |v| values << v }
      input.value = 3
      values.should eq [4]
    end

    it "are not fired if no change" do
      values = [] of Int32
      input = React::InputCell.new(1)
      output = React::ComputeCell.new(input) { |v| v < 3 ? 111 : 222 }
      output.add_callback { |v| values << v }
      input.value = 2
      values.should eq [] of Int32
      input.value = 4
      values.should eq [222]
    end

    it "can be added and removed" do
      values1 = [] of Int32
      values2 = [] of Int32
      values3 = [] of Int32
      input = React::InputCell.new(1)
      output = React::ComputeCell.new(input) { |v| v + 1 }
      callback = output.add_callback { |v| values1 << v }
      output.add_callback { |v| values2 << v }
      input.value = 31
      values1.should eq [32]
      values2.should eq [32]
      output.remove_callback(callback)
      output.add_callback { |v| values3 << v }
      input.value = 41
      values1.should eq [32]
      values2.should eq [32, 42]
      values3.should eq [42]
    end

    it "don't interfere with other callbacks if removed multiple times" do
      values1 = [] of Int32
      values2 = [] of Int32
      input = React::InputCell.new(1)
      output = React::ComputeCell.new(input) { |v| v + 1 }
      callback = output.add_callback { |v| values1 << v }
      output.add_callback { |v| values2 << v }
      10.times { output.remove_callback(callback) }
      input.value = 2
      values1.should eq [] of Int32
      values2.should eq [3]
    end

    it "are called only once even if multiple dependencies change" do
      values = [] of Int32
      input = React::InputCell.new(1)
      plus_one = React::ComputeCell.new(input) { |v| v + 1 }
      minus_one1 = React::ComputeCell.new(input) { |v| v - 1 }
      minus_one2 = React::ComputeCell.new(minus_one1) { |v| v - 1 }
      output = React::ComputeCell.new(plus_one, minus_one2) { |v1, v2| v1 * v2 }
      output.add_callback { |v| values << v }
      input.value = 4
      values.should eq [10]
    end

    it "are not called if dependencies change in such a way that final value doesn't change" do
      values = [] of Int32
      input = React::InputCell.new(1)
      plus_one = React::ComputeCell.new(input) { |v| v + 1 }
      minus_one = React::ComputeCell.new(input) { |v| v - 1 }
      always_two = React::ComputeCell.new(plus_one, minus_one) { |v1, v2| v1 - v2 }
      always_two.add_callback { |v| values << v }
      10.times { |i| input.value = i }
      values.should eq [] of Int32
    end
  end
end
