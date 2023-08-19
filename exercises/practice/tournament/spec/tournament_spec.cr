require "spec"
require "../src/*"

describe "Tournament" do
  it "just the header if no input" do
    Tournament.tally([] of String).should eq([
      "Team                           | MP |  W |  D |  L |  P",
    ])
  end

  pending "a win is three points, a loss is zero points" do
    Tournament.tally([
      "Allegoric Alaskans;Blithering Badgers;win",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3",
      "Blithering Badgers             |  1 |  0 |  0 |  1 |  0",
    ])
  end

  pending "a win can also be expressed as a loss" do
    Tournament.tally([
      "Blithering Badgers;Allegoric Alaskans;loss",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3",
      "Blithering Badgers             |  1 |  0 |  0 |  1 |  0",
    ])
  end

  pending "a different team can win" do
    Tournament.tally([
      "Blithering Badgers;Allegoric Alaskans;win",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Blithering Badgers             |  1 |  1 |  0 |  0 |  3",
      "Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0",
    ])
  end

  pending "a draw is one point each" do
    Tournament.tally([
      "Allegoric Alaskans;Blithering Badgers;draw",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1",
      "Blithering Badgers             |  1 |  0 |  1 |  0 |  1",
    ])
  end

  pending "There can be more than one match" do
    Tournament.tally([
      "Allegoric Alaskans;Blithering Badgers;win",
      "Allegoric Alaskans;Blithering Badgers;win",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6",
      "Blithering Badgers             |  2 |  0 |  0 |  2 |  0",
    ])
  end

  pending "There can be more than one winner" do
    Tournament.tally([
      "Allegoric Alaskans;Blithering Badgers;loss",
      "Allegoric Alaskans;Blithering Badgers;win",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3",
      "Blithering Badgers             |  2 |  1 |  0 |  1 |  3",
    ])
  end

  pending "There can be more than two teams" do
    Tournament.tally([
      "Allegoric Alaskans;Blithering Badgers;win",
      "Blithering Badgers;Courageous Californians;win",
      "Courageous Californians;Allegoric Alaskans;loss",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6",
      "Blithering Badgers             |  2 |  1 |  0 |  1 |  3",
      "Courageous Californians        |  2 |  0 |  0 |  2 |  0",
    ])
  end

  pending "typical input" do
    Tournament.tally([
      "Allegoric Alaskans;Blithering Badgers;win",
      "Devastating Donkeys;Courageous Californians;draw",
      "Devastating Donkeys;Allegoric Alaskans;win",
      "Courageous Californians;Blithering Badgers;loss",
      "Blithering Badgers;Devastating Donkeys;loss",
      "Allegoric Alaskans;Courageous Californians;win",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Devastating Donkeys            |  3 |  2 |  1 |  0 |  7",
      "Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6",
      "Blithering Badgers             |  3 |  1 |  0 |  2 |  3",
      "Courageous Californians        |  3 |  0 |  1 |  2 |  1",
    ])
  end

  pending "incomplete competition (not all pairs have played)" do
    Tournament.tally([
      "Allegoric Alaskans;Blithering Badgers;loss",
      "Devastating Donkeys;Allegoric Alaskans;loss",
      "Courageous Californians;Blithering Badgers;draw",
      "Allegoric Alaskans;Courageous Californians;win",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6",
      "Blithering Badgers             |  2 |  1 |  1 |  0 |  4",
      "Courageous Californians        |  2 |  0 |  1 |  1 |  1",
      "Devastating Donkeys            |  1 |  0 |  0 |  1 |  0",
    ])
  end

  pending "ties broken alphabetically" do
    Tournament.tally([
      "Courageous Californians;Devastating Donkeys;win",
      "Allegoric Alaskans;Blithering Badgers;win",
      "Devastating Donkeys;Allegoric Alaskans;loss",
      "Courageous Californians;Blithering Badgers;win",
      "Blithering Badgers;Devastating Donkeys;draw",
      "Allegoric Alaskans;Courageous Californians;draw",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7",
      "Courageous Californians        |  3 |  2 |  1 |  0 |  7",
      "Blithering Badgers             |  3 |  0 |  1 |  2 |  1",
      "Devastating Donkeys            |  3 |  0 |  1 |  2 |  1",
    ])
  end

  pending "ensure points sorted numerically" do
    Tournament.tally([
      "Devastating Donkeys;Blithering Badgers;win",
      "Devastating Donkeys;Blithering Badgers;win",
      "Devastating Donkeys;Blithering Badgers;win",
      "Devastating Donkeys;Blithering Badgers;win",
      "Blithering Badgers;Devastating Donkeys;win",
    ]).should eq([
      "Team                           | MP |  W |  D |  L |  P",
      "Devastating Donkeys            |  5 |  4 |  0 |  1 | 12",
      "Blithering Badgers             |  5 |  1 |  0 |  4 |  3",
    ])
  end
end
