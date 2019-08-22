require "spec"
require "../src/*"

describe "Forth" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "numbers just get pushed onto the stack" do
    Forth.evaluate("1 2 3 4 5").should eq([1, 2, 3, 4, 5])
  end

  {{pending.id}} "can add two numbers" do
    Forth.evaluate("1 2 +").should eq([3])
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("+")
    end
  end

  {{pending.id}} "errors if there is only one value on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("1 +")
    end
  end

  {{pending.id}} "can subtract two numbers" do
    Forth.evaluate("3 4 -").should eq([-1])
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("-")
    end
  end

  {{pending.id}} "errors if there is only one value on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("1 -")
    end
  end

  {{pending.id}} "can multiply two numbers" do
    Forth.evaluate("2 4 *").should eq([8])
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("*")
    end
  end

  {{pending.id}} "errors if there is only one value on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("1 *")
    end
  end

  {{pending.id}} "can divide two numbers" do
    Forth.evaluate("12 3 /").should eq([4])
  end

  {{pending.id}} "performs integer division" do
    Forth.evaluate("8 3 /").should eq([2])
  end

  {{pending.id}} "errors if dividing by zero" do
    expect_raises(Exception) do
      Forth.evaluate("4 0 /")
    end
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("/")
    end
  end

  {{pending.id}} "errors if there is only one value on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("1 /")
    end
  end

  {{pending.id}} "addition and subtraction" do
    Forth.evaluate("1 2 + 4 -").should eq([-1])
  end

  {{pending.id}} "multiplication and division" do
    Forth.evaluate("2 4 * 3 /").should eq([2])
  end

  {{pending.id}} "copies a value on the stack" do
    Forth.evaluate("1 dup").should eq([1, 1])
  end

  {{pending.id}} "copies the top value on the stack" do
    Forth.evaluate("1 2 dup").should eq([1, 2, 2])
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("dup")
    end
  end

  {{pending.id}} "removes the top value on the stack if it is the only one" do
    Forth.evaluate("1 drop").should eq([] of Int32)
  end

  {{pending.id}} "removes the top value on the stack if it is not the only one" do
    Forth.evaluate("1 2 drop").should eq([1])
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("drop")
    end
  end

  {{pending.id}} "swaps the top two values on the stack if they are the only ones" do
    Forth.evaluate("1 2 swap").should eq([2, 1])
  end

  {{pending.id}} "swaps the top two values on the stack if they are not the only ones" do
    Forth.evaluate("1 2 3 swap").should eq([1, 3, 2])
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("swap")
    end
  end

  {{pending.id}} "errors if there is only one value on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("1 swap")
    end
  end

  {{pending.id}} "copies the second element if there are only two" do
    Forth.evaluate("1 2 over").should eq([1, 2, 1])
  end

  {{pending.id}} "copies the second element if there are more than two" do
    Forth.evaluate("1 2 3 over").should eq([1, 2, 3, 2])
  end

  {{pending.id}} "errors if there is nothing on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("over")
    end
  end

  {{pending.id}} "errors if there is only one value on the stack" do
    expect_raises(Exception) do
      Forth.evaluate("1 over")
    end
  end

  {{pending.id}} "can consist of built-in words" do
    Forth.evaluate(": dup-twice dup dup ;").should eq([1, 1, 1])
  end

  {{pending.id}} "execute in the right order" do
    Forth.evaluate(": countup 1 2 3 ;").should eq([1, 2, 3])
  end

  {{pending.id}} "can override other user-defined words" do
    Forth.evaluate(": foo dup ;").should eq([1, 1, 1])
  end

  {{pending.id}} "can override built-in words" do
    Forth.evaluate(": swap dup ;").should eq([1, 1])
  end

  {{pending.id}} "can override built-in operators" do
    Forth.evaluate(": + * ;").should eq([12])
  end

  {{pending.id}} "can use different words with the same name" do
    Forth.evaluate(": foo 5 ;").should eq([5, 6])
  end

  {{pending.id}} "can define word that uses word with the same name" do
    Forth.evaluate(": foo 10 ;").should eq([11])
  end

  {{pending.id}} "cannot redefine numbers" do
    expect_raises(Exception) do
      Forth.evaluate(": 1 2 ;")
    end
  end

  {{pending.id}} "errors if executing a non-existent word" do
    expect_raises(Exception) do
      Forth.evaluate("foo")
    end
  end

  {{pending.id}} "DUP is case-insensitive" do
    Forth.evaluate("1 DUP Dup dup").should eq([1, 1, 1, 1])
  end

  {{pending.id}} "DROP is case-insensitive" do
    Forth.evaluate("1 2 3 4 DROP Drop drop").should eq([1])
  end

  {{pending.id}} "SWAP is case-insensitive" do
    Forth.evaluate("1 2 SWAP 3 Swap 4 swap").should eq([2, 3, 4, 1])
  end

  {{pending.id}} "OVER is case-insensitive" do
    Forth.evaluate("1 2 OVER Over over").should eq([1, 2, 1, 2, 1])
  end

  {{pending.id}} "user-defined words are case-insensitive" do
    Forth.evaluate(": foo dup ;").should eq([1, 1, 1, 1])
  end

  {{pending.id}} "definitions are case-insensitive" do
    Forth.evaluate(": SWAP DUP Dup dup ;").should eq([1, 1, 1, 1])
  end
  {% end %}
end
