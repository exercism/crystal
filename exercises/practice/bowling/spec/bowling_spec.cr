require "spec"
require "../src/*"

describe "Bowling" do
  it "should be able to score a game with all zeros" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(0)
  end

  pending "should be able to score a game with no strikes or spares" do
    game = Bowling.new
    [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(90)
  end

  pending "a spare followed by zeros is worth ten points" do
    game = Bowling.new
    [6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(10)
  end

  pending "points scored in the roll after a spare are counted twice" do
    game = Bowling.new
    [6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(16)
  end

  pending "consecutive spares each get a one roll bonus" do
    game = Bowling.new
    [5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(31)
  end

  pending "a spare in the last frame gets a one roll bonus that is counted once" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(17)
  end

  pending "a strike earns ten points in a frame with a single roll" do
    game = Bowling.new
    [10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(10)
  end

  pending "points scored in the two rolls after a strike are counted twice as a bonus" do
    game = Bowling.new
    [10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(26)
  end

  pending "consecutive strikes each get the two roll bonus" do
    game = Bowling.new
    [10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(81)
  end

  pending "a strike in the last frame gets a two roll bonus that is counted once" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(18)
  end

  pending "rolling a spare with the two roll bonus does not get a bonus roll" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(20)
  end

  pending "strikes with the two roll bonus do not get bonus rolls" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(30)
  end

  pending "last two strikes followed by only last bonus with non strike points" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 1].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(31)
  end

  pending "a strike with the one roll bonus after a spare in the last frame does not get a bonus" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(20)
  end

  pending "all strikes is a perfect game" do
    game = Bowling.new
    [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(300)
  end

  pending "rolls cannot score negative points" do
    game = Bowling.new
    expect_raises(ArgumentError) do
      game.roll(-1)
    end
  end

  pending "a roll cannot score more than 10 points" do
    game = Bowling.new
    expect_raises(ArgumentError) do
      game.roll(11)
    end
  end

  pending "two rolls in a frame cannot score more than 10 points" do
    game = Bowling.new
    [5].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(6)
    end
  end

  pending "bonus roll after a strike in the last frame cannot score more than 10 points" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(11)
    end
  end

  pending "two bonus rolls after a strike in the last frame cannot score more than 10 points" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(6)
    end
  end

  pending "two bonus rolls after a strike in the last frame can score more than 10 points if one is a strike" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6].each do |roll|
      game.roll(roll)
    end
    game.score.should eq(26)
  end

  pending "the second bonus rolls after a strike in the last frame cannot be a strike if the first one is not a strike" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(10)
    end
  end

  pending "second bonus roll after a strike in the last frame cannot score more than 10 points" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(11)
    end
  end

  pending "an unstarted game cannot be scored" do
    game = Bowling.new
    expect_raises(ArgumentError) do
      game.score
    end
  end

  pending "an incomplete game cannot be scored" do
    game = Bowling.new
    [0, 0].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.score
    end
  end

  pending "cannot roll if game already has ten frames" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(0)
    end
  end

  pending "bonus rolls for a strike in the last frame must be rolled before score can be calculated" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.score
    end
  end

  pending "both bonus rolls for a strike in the last frame must be rolled before score can be calculated" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.score
    end
  end

  pending "bonus roll for a spare in the last frame must be rolled before score can be calculated" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.score
    end
  end

  pending "cannot roll after bonus roll for spare" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(2)
    end
  end

  pending "cannot roll after bonus rolls for strike" do
    game = Bowling.new
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2].each do |roll|
      game.roll(roll)
    end
    expect_raises(ArgumentError) do
      game.roll(2)
    end
  end
end
