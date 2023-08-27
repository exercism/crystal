require "spec"
require "../src/*"

describe "CircularBuffer" do
  it "reading empty buffer should fail" do
    buffer = CircularBuffer.new(1)
    expect_raises(RuntimeError) do
      buffer.read
    end
  end

  pending "can read an item just written" do
    buffer = CircularBuffer.new(1)
    buffer.write(1)
    buffer.read.should eq(1)
  end

  pending "each item may only be read once" do
    buffer = CircularBuffer.new(1)
    buffer.write(1)
    buffer.read.should eq(1)
    expect_raises(RuntimeError) do
      buffer.read
    end
  end

  pending "items are read in the order they are written" do
    buffer = CircularBuffer.new(2)
    buffer.write(1)
    buffer.write(2)
    buffer.read.should eq(1)
    buffer.read.should eq(2)
  end

  pending "full buffer can't be written to" do
    buffer = CircularBuffer.new(1)
    buffer.write(1)
    expect_raises(RuntimeError) do
      buffer.write(2)
    end
  end

  pending "a read frees up capacity for another write" do
    buffer = CircularBuffer.new(1)
    buffer.write(1)
    buffer.read.should eq(1)
    buffer.write(2)
    buffer.read.should eq(2)
  end

  pending "read position is maintained even across multiple writes" do
    buffer = CircularBuffer.new(3)
    buffer.write(1)
    buffer.write(2)
    buffer.read.should eq(1)
    buffer.write(3)
    buffer.read.should eq(2)
    buffer.read.should eq(3)
  end

  pending "items cleared out of buffer can't be read" do
    buffer = CircularBuffer.new(1)
    buffer.write(1)
    buffer.clear
    expect_raises(RuntimeError) do
      buffer.read
    end
  end

  pending "clear frees up capacity for another write" do
    buffer = CircularBuffer.new(1)
    buffer.write(1)
    buffer.clear
    buffer.write(2)
    buffer.read.should eq(2)
  end

  pending "clear does nothing on empty buffer" do
    buffer = CircularBuffer.new(1)
    buffer.clear
    buffer.write(1)
    buffer.read.should eq(1)
  end

  pending "overwrite acts like write on non-full buffer" do
    buffer = CircularBuffer.new(2)
    buffer.write(1)
    buffer.overwrite(2)
    buffer.read.should eq(1)
    buffer.read.should eq(2)
  end

  pending "overwrite replaces the oldest item on full buffer" do
    buffer = CircularBuffer.new(2)
    buffer.write(1)
    buffer.write(2)
    buffer.overwrite(3)
    buffer.read.should eq(2)
    buffer.read.should eq(3)
  end

  pending "overwrite replaces the oldest item remaining in buffer following a read" do
    buffer = CircularBuffer.new(3)
    buffer.write(1)
    buffer.write(2)
    buffer.write(3)
    buffer.read.should eq(1)
    buffer.write(4)
    buffer.overwrite(5)
    buffer.read.should eq(3)
    buffer.read.should eq(4)
    buffer.read.should eq(5)
  end

  pending "initial clear does not affect wrapping around" do
    buffer = CircularBuffer.new(2)
    buffer.clear
    buffer.write(1)
    buffer.write(2)
    buffer.overwrite(3)
    buffer.overwrite(4)
    buffer.read.should eq(3)
    buffer.read.should eq(4)
    expect_raises(RuntimeError) do
      buffer.read
    end
  end
end
