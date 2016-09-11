require "spec"
require "./react"

describe Reactor do
  describe "input cells" do
    it "have a value" do
      reactor = Reactor.new
      input = reactor.create_input(10)
      input.value.should eq 10
    end

    pending "can have values set" do
      reactor = Reactor.new
      input = reactor.create_input(4)
      input.value = 20
      input.value.should eq 20
    end
  end

  describe "compute cells" do
    pending "calculate initial value" do
      reactor = Reactor.new
      input = reactor.create_input(1)
      output = reactor.create_compute(input) { |v| v + 1 }
      output.value.should eq 2
    end

    pending "take input in the right order" do
      reactor = Reactor.new
      one = reactor.create_input(1)
      two = reactor.create_input(2)
      output = reactor.create_compute(one, two) { |v1, v2| v1 + v2 * 10 }
      output.value.should eq 21
    end

    pending "update value when dependencies are changed" do
      reactor = Reactor.new
      one = reactor.create_input(1)
      output = reactor.create_compute(one) { |v| v + 1 }
      one.value = 3
      output.value.should eq 4
    end

    pending "can depend on other compute cells" do
      reactor = Reactor.new
      input = reactor.create_input(1)
      times_two = reactor.create_compute(input) { |v| v * 2 }
      times_thirty = reactor.create_compute(input) { |v| v * 30 }
      output = reactor.create_compute(times_two, times_thirty) { |v1, v2| v1 + v2 }
      output.value.should eq 32
      input.value = 3
      output.value.should eq 96
    end
  end

  describe "callbacks" do
    pending "are fired on change" do
      values = [] of Int32
      reactor = Reactor.new
      input = reactor.create_input(1)
      output = reactor.create_compute(input) { |v| v + 1 }
      output.add_callback { |v| values << v }
      input.value = 3
      values.should eq [4]
    end

    pending "are not fired if no change" do
      values = [] of Int32
      reactor = Reactor.new
      input = reactor.create_input(1)
      output = reactor.create_compute(input) { |v| v < 3 ? 111 : 222 }
      output.add_callback { |v| values << v }
      input.value = 2
      values.should eq [] of Int32
      input.value = 4
      values.should eq [222]
    end

    pending "can be added and removed" do
      values1 = [] of Int32
      values2 = [] of Int32
      values3 = [] of Int32
      reactor = Reactor.new
      input = reactor.create_input(1)
      output = reactor.create_compute(input) { |v| v + 1 }
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

    pending "don't interfere with other callbacks if removed multiple times" do
      values1 = [] of Int32
      values2 = [] of Int32
      reactor = Reactor.new
      input = reactor.create_input(1)
      output = reactor.create_compute(input) { |v| v + 1 }
      callback = output.add_callback { |v| values1 << v }
      output.add_callback { |v| values2 << v }
      10.times { output.remove_callback(callback) }
      input.value = 2
      values1.should eq [] of Int32
      values2.should eq [3]
    end

    pending "are called only once even if multiple dependencies change" do
      values = [] of Int32
      reactor = Reactor.new
      input = reactor.create_input(1)
      plus_one = reactor.create_compute(input) { |v| v + 1 }
      minus_one1 = reactor.create_compute(input) { |v| v - 1 }
      minus_one2 = reactor.create_compute(minus_one1) { |v| v - 1 }
      output = reactor.create_compute(plus_one, minus_one2) { |v1, v2| v1 * v2 }
      output.add_callback { |v| values << v }
      input.value = 4
      values.should eq [10]
    end

    pending "are not called if dependencies change in such a way that final value doesn't change" do
      values = [] of Int32
      reactor = Reactor.new
      input = reactor.create_input(1)
      plus_one = reactor.create_compute(input) { |v| v + 1 }
      minus_one = reactor.create_compute(input) { |v| v - 1 }
      always_two = reactor.create_compute(plus_one, minus_one) { |v1, v2| v1 - v2 }
      always_two.add_callback { |v| values << v }
      10.times { |i| input.value = i }
      values.should eq [] of Int32
    end
  end
end
