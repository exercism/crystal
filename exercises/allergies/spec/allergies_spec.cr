require "spec"
require "../src/*"

describe "Allergies" do
  it "not allergic to anything" do
    Allergies.allergic_to("eggs", 0).should eq(false)
  end

  pending "allergic only to eggs" do
    Allergies.allergic_to("eggs", 1).should eq(true)
  end

  pending "allergic to eggs and something else" do
    Allergies.allergic_to("eggs", 3).should eq(true)
  end

  pending "allergic to something, but not eggs" do
    Allergies.allergic_to("eggs", 2).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("eggs", 255).should eq(true)
  end

  pending "not allergic to anything" do
    Allergies.allergic_to("peanuts", 0).should eq(false)
  end

  pending "allergic only to peanuts" do
    Allergies.allergic_to("peanuts", 2).should eq(true)
  end

  pending "allergic to peanuts and something else" do
    Allergies.allergic_to("peanuts", 7).should eq(true)
  end

  pending "allergic to something, but not peanuts" do
    Allergies.allergic_to("peanuts", 5).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("peanuts", 255).should eq(true)
  end

  pending "not allergic to anything" do
    Allergies.allergic_to("shellfish", 0).should eq(false)
  end

  pending "allergic only to shellfish" do
    Allergies.allergic_to("shellfish", 4).should eq(true)
  end

  pending "allergic to shellfish and something else" do
    Allergies.allergic_to("shellfish", 14).should eq(true)
  end

  pending "allergic to something, but not shellfish" do
    Allergies.allergic_to("shellfish", 10).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("shellfish", 255).should eq(true)
  end

  pending "not allergic to anything" do
    Allergies.allergic_to("strawberries", 0).should eq(false)
  end

  pending "allergic only to strawberries" do
    Allergies.allergic_to("strawberries", 8).should eq(true)
  end

  pending "allergic to strawberries and something else" do
    Allergies.allergic_to("strawberries", 28).should eq(true)
  end

  pending "allergic to something, but not strawberries" do
    Allergies.allergic_to("strawberries", 20).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("strawberries", 255).should eq(true)
  end

  pending "not allergic to anything" do
    Allergies.allergic_to("tomatoes", 0).should eq(false)
  end

  pending "allergic only to tomatoes" do
    Allergies.allergic_to("tomatoes", 16).should eq(true)
  end

  pending "allergic to tomatoes and something else" do
    Allergies.allergic_to("tomatoes", 56).should eq(true)
  end

  pending "allergic to something, but not tomatoes" do
    Allergies.allergic_to("tomatoes", 40).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("tomatoes", 255).should eq(true)
  end

  pending "not allergic to anything" do
    Allergies.allergic_to("chocolate", 0).should eq(false)
  end

  pending "allergic only to chocolate" do
    Allergies.allergic_to("chocolate", 32).should eq(true)
  end

  pending "allergic to chocolate and something else" do
    Allergies.allergic_to("chocolate", 112).should eq(true)
  end

  pending "allergic to something, but not chocolate" do
    Allergies.allergic_to("chocolate", 80).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("chocolate", 255).should eq(true)
  end

  pending "not allergic to anything" do
    Allergies.allergic_to("pollen", 0).should eq(false)
  end

  pending "allergic only to pollen" do
    Allergies.allergic_to("pollen", 64).should eq(true)
  end

  pending "allergic to pollen and something else" do
    Allergies.allergic_to("pollen", 224).should eq(true)
  end

  pending "allergic to something, but not pollen" do
    Allergies.allergic_to("pollen", 160).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("pollen", 255).should eq(true)
  end

  pending "not allergic to anything" do
    Allergies.allergic_to("cats", 0).should eq(false)
  end

  pending "allergic only to cats" do
    Allergies.allergic_to("cats", 128).should eq(true)
  end

  pending "allergic to cats and something else" do
    Allergies.allergic_to("cats", 192).should eq(true)
  end

  pending "allergic to something, but not cats" do
    Allergies.allergic_to("cats", 64).should eq(false)
  end

  pending "allergic to everything" do
    Allergies.allergic_to("cats", 255).should eq(true)
  end

  pending "no allergies" do
    Allergies.list(0).should eq([] of String)
  end

  pending "just eggs" do
    Allergies.list(1).should eq(["eggs"])
  end

  pending "just peanuts" do
    Allergies.list(2).should eq(["peanuts"])
  end

  pending "just strawberries" do
    Allergies.list(8).should eq(["strawberries"])
  end

  pending "eggs and peanuts" do
    Allergies.list(3).should eq(["eggs", "peanuts"])
  end

  pending "more than eggs but not peanuts" do
    Allergies.list(5).should eq(["eggs", "shellfish"])
  end

  pending "lots of stuff" do
    Allergies.list(248).should eq(["strawberries", "tomatoes", "chocolate", "pollen", "cats"])
  end

  pending "everything" do
    Allergies.list(255).should eq(["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"])
  end

  pending "no allergen score parts" do
    Allergies.list(509).should eq(["eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"])
  end
end
