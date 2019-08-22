require "spec"
require "../src/*"

describe "PascalsTriangle" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "will return the first 0 row(s)" do
    PascalsTriangle.rows(0).should eq([] of Int32)
  end

  {{pending.id}} "will return the first 1 row(s)" do
    PascalsTriangle.rows(1).should eq([[1]])
  end

  {{pending.id}} "will return the first 2 row(s)" do
    PascalsTriangle.rows(2).should eq([[1], [1, 1]])
  end

  {{pending.id}} "will return the first 3 row(s)" do
    PascalsTriangle.rows(3).should eq([[1], [1, 1], [1, 2, 1]])
  end

  {{pending.id}} "will return the first 4 row(s)" do
    PascalsTriangle.rows(4).should eq([[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]])
  end

  {{pending.id}} "will return the first 5 row(s)" do
    PascalsTriangle.rows(5).should eq([[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]])
  end

  {{pending.id}} "will return the first 6 row(s)" do
    PascalsTriangle.rows(6).should eq([[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]])
  end

  {{pending.id}} "will return the first 10 row(s)" do
    PascalsTriangle.rows(10).should eq([[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]])
  end
  {% end %}
end
