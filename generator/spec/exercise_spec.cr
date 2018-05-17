require "spec"
require "../src/exercise"

require "json"
require "./fixtures/test_test_case"

def get_canonical(name)
  File.read("#{__DIR__}/fixtures/data/#{name}.json")
end

describe Exercise::Spec do
  it "can load exercism-like json" do
    Exercise::Spec(TestTestCase).from_canonical(get_canonical("valid")).exercise.should eq("exercise")
  end

  it "can load nested exercism-like json" do
    Exercise::Spec(TestTestCase).from_canonical(get_canonical("group"))
      .cases.first.as(Exercise::TestGroup)
      .cases.first.as(Exercise::TestCase).property.should eq("one")
  end

  it "will error when invalid json is provided" do
    expect_raises(JSON::ParseException, /Unexpected token: EOF/) do
      Exercise::Spec(TestTestCase).from_canonical(get_canonical("invalid"))
    end
  end

  it "will error when non-canonical data is provided" do
    expect_raises(JSON::ParseException, /Missing json attribute: version/) do
      Exercise::Spec(TestTestCase).from_canonical(get_canonical("non-canonical"))
    end
  end

  it "should have its first unit test enabled" do
    spec = Exercise::Spec(TestTestCase).from_canonical(get_canonical("valid"))
    spec.to_s.should match(/it "should do whatevs" do.*pending "should do \+1" do/m)
  end

  it "renders to rspec dsl (normal workload)" do
    spec = Exercise::Spec(TestTestCase).from_canonical(get_canonical("valid"))
    spec.to_s.should match(/Test\.yup\(1\)\.should eq\(2\)/)
  end

  it "renders to rspec dsl (expect_raises)" do
    spec = Exercise::Spec(TestTestCase).from_canonical(get_canonical("raises-error"))
    spec.to_s.should match(/expect_raises\(ArgumentError\)/)
  end
end
