require "spec"
require "../src/*"

describe "Bob" do
  it "stating something" do
    Bob.hey("Tom-ay-to, tom-aaaah-to.").should eq("Whatever.")
  end

  pending "shouting" do
    Bob.hey("WATCH OUT!").should eq("Whoa, chill out!")
  end

  pending "shouting gibberish" do
    Bob.hey("FCECDFCAAB").should eq("Whoa, chill out!")
  end

  pending "asking a question" do
    Bob.hey("Does this cryogenic chamber make me look fat?").should eq("Sure.")
  end

  pending "asking a numeric question" do
    Bob.hey("You are, what, like 15?").should eq("Sure.")
  end

  pending "asking gibberish" do
    Bob.hey("fffbbcbeab?").should eq("Sure.")
  end

  pending "talking forcefully" do
    Bob.hey("Hi there!").should eq("Whatever.")
  end

  pending "using acronyms in regular speech" do
    Bob.hey("It's OK if you don't want to go work for NASA.").should eq("Whatever.")
  end

  pending "forceful question" do
    Bob.hey("WHAT'S GOING ON?").should eq("Calm down, I know what I'm doing!")
  end

  pending "shouting numbers" do
    Bob.hey("1, 2, 3 GO!").should eq("Whoa, chill out!")
  end

  pending "no letters" do
    Bob.hey("1, 2, 3").should eq("Whatever.")
  end

  pending "question with no letters" do
    Bob.hey("4?").should eq("Sure.")
  end

  pending "shouting with special characters" do
    Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!").should eq("Whoa, chill out!")
  end

  pending "shouting with no exclamation mark" do
    Bob.hey("I HATE THE DENTIST").should eq("Whoa, chill out!")
  end

  pending "statement containing question mark" do
    Bob.hey("Ending with ? means a question.").should eq("Whatever.")
  end

  pending "non-letters with question" do
    Bob.hey(":) ?").should eq("Sure.")
  end

  pending "prattling on" do
    Bob.hey("Wait! Hang on. Are you going to be OK?").should eq("Sure.")
  end

  pending "silence" do
    Bob.hey("").should eq("Fine. Be that way!")
  end

  pending "prolonged silence" do
    Bob.hey("          ").should eq("Fine. Be that way!")
  end

  pending "alternate silence" do
    Bob.hey("\t\t\t\t\t\t\t\t\t\t").should eq("Fine. Be that way!")
  end

  pending "starting with whitespace" do
    Bob.hey("         hmmmmmmm...").should eq("Whatever.")
  end

  pending "ending with whitespace" do
    Bob.hey("Okay if like my  spacebar  quite a bit?   ").should eq("Sure.")
  end

  pending "other whitespace" do
    Bob.hey("\n\r \t").should eq("Fine. Be that way!")
  end

  pending "non-question ending with whitespace" do
    Bob.hey("This is a statement ending with whitespace      ").should eq("Whatever.")
  end

  pending "multiple line question" do
    Bob.hey("\nDoes this cryogenic chamber make\n me look fat?").should eq("Sure.")
  end
end
