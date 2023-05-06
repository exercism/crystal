require "spec"
require "../src/*"

describe "TwoBucket" do
  it "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one" do
    TwoBucket.measure(
      bucket_one: 3,
      bucket_two: 5,
      goal: 1,
      start_bucket: TwoBucket::Bucket::One
    ).should eq TwoBucket::Result.new(
      moves: 4,
      other_bucket: 5,
      goal_bucket: TwoBucket::Bucket::One
    )
  end

  pending "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two" do
    TwoBucket.measure(
      bucket_one: 3,
      bucket_two: 5,
      goal: 1,
      start_bucket: TwoBucket::Bucket::Two
    ).should eq TwoBucket::Result.new(
      moves: 8,
      other_bucket: 3,
      goal_bucket: TwoBucket::Bucket::Two
    )
  end

  pending "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one" do
    TwoBucket.measure(
      bucket_one: 7,
      bucket_two: 11,
      goal: 2,
      start_bucket: TwoBucket::Bucket::One
    ).should eq TwoBucket::Result.new(
      moves: 14,
      other_bucket: 11,
      goal_bucket: TwoBucket::Bucket::One
    )
  end

  pending "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two" do
    TwoBucket.measure(
      bucket_one: 7,
      bucket_two: 11,
      goal: 2,
      start_bucket: TwoBucket::Bucket::Two
    ).should eq TwoBucket::Result.new(
      moves: 18,
      other_bucket: 7,
      goal_bucket: TwoBucket::Bucket::Two
    )
  end

  pending "Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two" do
    TwoBucket.measure(
      bucket_one: 1,
      bucket_two: 3,
      goal: 3,
      start_bucket: TwoBucket::Bucket::Two
    ).should eq TwoBucket::Result.new(
      moves: 1,
      other_bucket: 0,
      goal_bucket: TwoBucket::Bucket::Two
    )
  end

  pending "Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two" do
    TwoBucket.measure(
      bucket_one: 2,
      bucket_two: 3,
      goal: 3,
      start_bucket: TwoBucket::Bucket::One
    ).should eq TwoBucket::Result.new(
      moves: 2,
      other_bucket: 2,
      goal_bucket: TwoBucket::Bucket::Two
    )
  end

  pending "Not possible to reach the goal" do
    expect_raises(ArgumentError) do
      TwoBucket.measure(
        bucket_one: 6,
        bucket_two: 15,
        goal: 5,
        start_bucket: TwoBucket::Bucket::One
      )
    end
  end

  pending "With the same buckets but a different goal, then it is possible" do
    TwoBucket.measure(
      bucket_one: 6,
      bucket_two: 15,
      goal: 9,
      start_bucket: TwoBucket::Bucket::One
    ).should eq TwoBucket::Result.new(
      moves: 10,
      other_bucket: 0,
      goal_bucket: TwoBucket::Bucket::Two
    )
  end

  pending "Goal larger than both buckets is impossible" do
    expect_raises(ArgumentError) do
      TwoBucket.measure(
        bucket_one: 5,
        bucket_two: 7,
        goal: 8,
        start_bucket: TwoBucket::Bucket::One
      )
    end
  end
end
