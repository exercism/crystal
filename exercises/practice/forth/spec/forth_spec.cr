require "spec"
require "../src/*"

describe "Forth" do
  it "numbers just get pushed onto the stack" do
    Forth.evaluate("1 2 3 4 5").should eq([1, 2, 3, 4, 5] of Int32)
  end

  pending "pushes negative numbers onto the stack" do
    Forth.evaluate("-1 -2 -3 -4 -5").should eq([-1, -2, -3, -4, -5] of Int32)
  end

  pending "can add two numbers" do
    Forth.evaluate("1 2 +").should eq([3] of Int32)
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("+")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("1 +")
    end
  end

  pending "more than two values on the stack" do
    Forth.evaluate("1 2 3 +").should eq([1, 5] of Int32)
  end

  pending "can subtract two numbers" do
    Forth.evaluate("3 4 -").should eq([-1] of Int32)
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("-")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("1 -")
    end
  end

  pending "more than two values on the stack" do
    Forth.evaluate("1 12 3 -").should eq([1, 9] of Int32)
  end

  pending "can multiply two numbers" do
    Forth.evaluate("2 4 *").should eq([8] of Int32)
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("*")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("1 *")
    end
  end

  pending "more than two values on the stack" do
    Forth.evaluate("1 2 3 *").should eq([1, 6] of Int32)
  end

  pending "can divide two numbers" do
    Forth.evaluate("12 3 /").should eq([4] of Int32)
  end

  pending "performs integer division" do
    Forth.evaluate("8 3 /").should eq([2] of Int32)
  end

  pending "errors if dividing by zero" do
    expect_raises(ArgumentError) do
      Forth.evaluate("4 0 /")
    end
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("/")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("1 /")
    end
  end

  pending "more than two values on the stack" do
    Forth.evaluate("1 12 3 /").should eq([1, 4] of Int32)
  end

  pending "addition and subtraction" do
    Forth.evaluate("1 2 + 4 -").should eq([-1] of Int32)
  end

  pending "multiplication and division" do
    Forth.evaluate("2 4 * 3 /").should eq([2] of Int32)
  end

  pending "multiplication and addition" do
    Forth.evaluate("1 3 4 * +").should eq([13] of Int32)
  end

  pending "addition and multiplication" do
    Forth.evaluate("1 3 4 + *").should eq([7] of Int32)
  end

  pending "copies a value on the stack" do
    Forth.evaluate("1 dup").should eq([1, 1] of Int32)
  end

  pending "copies the top value on the stack" do
    Forth.evaluate("1 2 dup").should eq([1, 2, 2] of Int32)
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("dup")
    end
  end

  pending "removes the top value on the stack if it is the only one" do
    Forth.evaluate("1 drop").should eq([] of Int32)
  end

  pending "removes the top value on the stack if it is not the only one" do
    Forth.evaluate("1 2 drop").should eq([1] of Int32)
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("drop")
    end
  end

  pending "swaps the top two values on the stack if they are the only ones" do
    Forth.evaluate("1 2 swap").should eq([2, 1] of Int32)
  end

  pending "swaps the top two values on the stack if they are not the only ones" do
    Forth.evaluate("1 2 3 swap").should eq([1, 3, 2] of Int32)
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("swap")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("1 swap")
    end
  end

  pending "copies the second element if there are only two" do
    Forth.evaluate("1 2 over").should eq([1, 2, 1] of Int32)
  end

  pending "copies the second element if there are more than two" do
    Forth.evaluate("1 2 3 over").should eq([1, 2, 3, 2] of Int32)
  end

  pending "errors if there is nothing on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("over")
    end
  end

  pending "errors if there is only one value on the stack" do
    expect_raises(ArgumentError) do
      Forth.evaluate("1 over")
    end
  end

  pending "can consist of built-in words" do
    Forth.evaluate(": dup-twice dup dup ;1 dup-twice").should eq([1, 1, 1] of Int32)
  end

  pending "execute in the right order" do
    Forth.evaluate(": countup 1 2 3 ;countup").should eq([1, 2, 3] of Int32)
  end

  pending "can override other user-defined words" do
    Forth.evaluate(": foo dup ;: foo dup dup ;1 foo").should eq([1, 1, 1] of Int32)
  end

  pending "can override built-in words" do
    Forth.evaluate(": swap dup ;1 swap").should eq([1, 1] of Int32)
  end

  pending "can override built-in operators" do
    Forth.evaluate(": + * ;3 4 +").should eq([12] of Int32)
  end

  pending "can use different words with the same name" do
    Forth.evaluate(": foo 5 ;: bar foo ;: foo 6 ;bar foo").should eq([5, 6] of Int32)
  end

  pending "can define word that uses word with the same name" do
    Forth.evaluate(": foo 10 ;: foo foo 1 + ;foo").should eq([11] of Int32)
  end

  pending "cannot redefine non-negative numbers" do
    expect_raises(ArgumentError) do
      Forth.evaluate(": 1 2 ;")
    end
  end

  pending "cannot redefine negative numbers" do
    expect_raises(ArgumentError) do
      Forth.evaluate(": -1 2 ;")
    end
  end

  pending "errors if executing a non-existent word" do
    expect_raises(ArgumentError) do
      Forth.evaluate("foo")
    end
  end

  pending "only defines locally" do
    result = Array(Array(Int32)).new
    result << Forth.evaluate(": + - ;1 1 +")
    result << Forth.evaluate("1 1 +")
    result.should eq([[0], [2]])
  end

  pending "DUP is case-insensitive" do
    Forth.evaluate("1 DUP Dup dup").should eq([1, 1, 1, 1] of Int32)
  end

  pending "DROP is case-insensitive" do
    Forth.evaluate("1 2 3 4 DROP Drop drop").should eq([1] of Int32)
  end

  pending "SWAP is case-insensitive" do
    Forth.evaluate("1 2 SWAP 3 Swap 4 swap").should eq([2, 3, 4, 1] of Int32)
  end

  pending "OVER is case-insensitive" do
    Forth.evaluate("1 2 OVER Over over").should eq([1, 2, 1, 2, 1] of Int32)
  end

  pending "user-defined words are case-insensitive" do
    Forth.evaluate(": foo dup ;1 FOO Foo foo").should eq([1, 1, 1, 1] of Int32)
  end

  pending "definitions are case-insensitive" do
    Forth.evaluate(": SWAP DUP Dup dup ;1 swap").should eq([1, 1, 1, 1] of Int32)
  end
end
