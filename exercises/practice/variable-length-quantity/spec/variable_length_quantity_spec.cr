require "spec"
require "../src/*"

describe "VariableLengthQuantity" do
  describe "Encode a series of integers, producing a series of bytes." do
    it "zero" do
      input = [0]
      expected = [0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "arbitrary single byte" do
      input = [64]
      expected = [64]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "largest single byte" do
      input = [127]
      expected = [127]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "smallest double byte" do
      input = [128]
      expected = [129, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "arbitrary double byte" do
      input = [8192]
      expected = [192, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "largest double byte" do
      input = [16383]
      expected = [255, 127]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "smallest triple byte" do
      input = [16384]
      expected = [129, 128, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "arbitrary triple byte" do
      input = [1048576]
      expected = [192, 128, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "largest triple byte" do
      input = [2097151]
      expected = [255, 255, 127]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "smallest quadruple byte" do
      input = [2097152]
      expected = [129, 128, 128, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "arbitrary quadruple byte" do
      input = [134217728]
      expected = [192, 128, 128, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "largest quadruple byte" do
      input = [268435455]
      expected = [255, 255, 255, 127]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "smallest quintuple byte" do
      input = [268435456]
      expected = [129, 128, 128, 128, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "arbitrary quintuple byte" do
      input = [4278190080]
      expected = [143, 248, 128, 128, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "maximum 32-bit integer input" do
      input = [4294967295]
      expected = [143, 255, 255, 255, 127]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "two single-byte values" do
      input = [64, 127]
      expected = [64, 127]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "two multi-byte values" do
      input = [16384, 1193046]
      expected = [129, 128, 0, 200, 232, 86]
      VariableLengthQuantity.encode(input).should eq(expected)
    end

    pending "many multi-byte values" do
      input = [8192, 1193046, 268435455, 0, 16383, 16384]
      expected = [192, 0, 200, 232, 86, 255, 255, 255, 127, 0, 255, 127, 129, 128, 0]
      VariableLengthQuantity.encode(input).should eq(expected)
    end
  end

  describe "Decode a series of bytes, producing a series of integers." do
    pending "one byte" do
      input = [127]
      expected = [127]
      VariableLengthQuantity.decode(input).should eq(expected)
    end

    pending "two bytes" do
      input = [192, 0]
      expected = [8192]
      VariableLengthQuantity.decode(input).should eq(expected)
    end

    pending "three bytes" do
      input = [255, 255, 127]
      expected = [2097151]
      VariableLengthQuantity.decode(input).should eq(expected)
    end

    pending "four bytes" do
      input = [129, 128, 128, 0]
      expected = [2097152]
      VariableLengthQuantity.decode(input).should eq(expected)
    end

    pending "maximum 32-bit integer" do
      input = [143, 255, 255, 255, 127]
      expected = [4294967295]
      VariableLengthQuantity.decode(input).should eq(expected)
    end

    pending "incomplete sequence causes error" do
      expect_raises(ArgumentError) do
        VariableLengthQuantity.decode([255])
      end
    end

    pending "incomplete sequence causes error, even if value is zero" do
      expect_raises(ArgumentError) do
        VariableLengthQuantity.decode([128])
      end
    end

    pending "multiple values" do
      input = [192, 0, 200, 232, 86, 255, 255, 255, 127, 0, 255, 127, 129, 128, 0]
      expected = [8192, 1193046, 268435455, 0, 16383, 16384]
      VariableLengthQuantity.decode(input).should eq(expected)
    end
  end
end
