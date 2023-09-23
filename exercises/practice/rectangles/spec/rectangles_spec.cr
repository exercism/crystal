require "spec"
require "../src/*"

describe "Rectangles" do
  it "no rows" do
    input = [] of String
    Rectangles.rectangles(input).should eq(0)
  end

  pending "no columns" do
    input = [
      "",
    ]
    Rectangles.rectangles(input).should eq(0)
  end

  pending "no rectangles" do
    input = [
      " ",
    ]
    Rectangles.rectangles(input).should eq(0)
  end

  pending "one rectangle" do
    input = [
      "+-+",
      "| |",
      "+-+",
    ]
    Rectangles.rectangles(input).should eq(1)
  end

  pending "two rectangles without shared parts" do
    input = [
      "  +-+",
      "  | |",
      "+-+-+",
      "| |  ",
      "+-+  ",
    ]
    Rectangles.rectangles(input).should eq(2)
  end

  pending "five rectangles with shared parts" do
    input = [
      "  +-+",
      "  | |",
      "+-+-+",
      "| | |",
      "+-+-+",
    ]
    Rectangles.rectangles(input).should eq(5)
  end

  pending "rectangle of height 1 is counted" do
    input = [
      "+--+",
      "+--+",
    ]
    Rectangles.rectangles(input).should eq(1)
  end

  pending "rectangle of width 1 is counted" do
    input = [
      "++",
      "||",
      "++",
    ]
    Rectangles.rectangles(input).should eq(1)
  end

  pending "1x1 square is counted" do
    input = [
      "++",
      "++",
    ]
    Rectangles.rectangles(input).should eq(1)
  end

  pending "only complete rectangles are counted" do
    input = [
      "  +-+",
      "    |",
      "+-+-+",
      "| | -",
      "+-+-+",
    ]
    Rectangles.rectangles(input).should eq(1)
  end

  pending "rectangles can be of different sizes" do
    input = [
      "+------+----+",
      "|      |    |",
      "+---+--+    |",
      "|   |       |",
      "+---+-------+",
    ]
    Rectangles.rectangles(input).should eq(3)
  end

  pending "corner is required for a rectangle to be complete" do
    input = [
      "+------+----+",
      "|      |    |",
      "+------+    |",
      "|   |       |",
      "+---+-------+",
    ]
    Rectangles.rectangles(input).should eq(2)
  end

  pending "large input with many rectangles" do
    input = [
      "+---+--+----+",
      "|   +--+----+",
      "+---+--+    |",
      "|   +--+----+",
      "+---+--+--+-+",
      "+---+--+--+-+",
      "+------+  | |",
      "          +-+",
    ]
    Rectangles.rectangles(input).should eq(60)
  end

  pending "rectangles must have four sides" do
    input = [
      "+-+ +-+",
      "| | | |",
      "+-+-+-+",
      "  | |  ",
      "+-+-+-+",
      "| | | |",
      "+-+ +-+",
    ]
    Rectangles.rectangles(input).should eq(5)
  end
end
