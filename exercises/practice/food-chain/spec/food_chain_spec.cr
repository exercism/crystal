require "spec"
require "../src/*"

describe "FoodChain" do
  it "fly" do
    expected = [
      "I know an old lady who swallowed a fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(1, 1).should eq(expected)
  end

  pending "spider" do
    expected = [
      "I know an old lady who swallowed a spider.",
      "It wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(2, 2).should eq(expected)
  end

  pending "bird" do
    expected = [
      "I know an old lady who swallowed a bird.",
      "How absurd to swallow a bird!",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(3, 3).should eq(expected)
  end

  pending "cat" do
    expected = [
      "I know an old lady who swallowed a cat.",
      "Imagine that, to swallow a cat!",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(4, 4).should eq(expected)
  end

  pending "dog" do
    expected = [
      "I know an old lady who swallowed a dog.",
      "What a hog, to swallow a dog!",
      "She swallowed the dog to catch the cat.",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(5, 5).should eq(expected)
  end

  pending "goat" do
    expected = [
      "I know an old lady who swallowed a goat.",
      "Just opened her throat and swallowed a goat!",
      "She swallowed the goat to catch the dog.",
      "She swallowed the dog to catch the cat.",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(6, 6).should eq(expected)
  end

  pending "cow" do
    expected = [
      "I know an old lady who swallowed a cow.",
      "I don't know how she swallowed a cow!",
      "She swallowed the cow to catch the goat.",
      "She swallowed the goat to catch the dog.",
      "She swallowed the dog to catch the cat.",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(7, 7).should eq(expected)
  end

  pending "horse" do
    expected = [
      "I know an old lady who swallowed a horse.",
      "She's dead, of course!",
    ]
    FoodChain.recite(8, 8).should eq(expected)
  end

  pending "multiple verses" do
    expected = [
      "I know an old lady who swallowed a fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a spider.",
      "It wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a bird.",
      "How absurd to swallow a bird!",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
    ]
    FoodChain.recite(1, 3).should eq(expected)
  end

  pending "full song" do
    expected = [
      "I know an old lady who swallowed a fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a spider.",
      "It wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a bird.",
      "How absurd to swallow a bird!",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a cat.",
      "Imagine that, to swallow a cat!",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a dog.",
      "What a hog, to swallow a dog!",
      "She swallowed the dog to catch the cat.",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a goat.",
      "Just opened her throat and swallowed a goat!",
      "She swallowed the goat to catch the dog.",
      "She swallowed the dog to catch the cat.",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a cow.",
      "I don't know how she swallowed a cow!",
      "She swallowed the cow to catch the goat.",
      "She swallowed the goat to catch the dog.",
      "She swallowed the dog to catch the cat.",
      "She swallowed the cat to catch the bird.",
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      "She swallowed the spider to catch the fly.",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "",
      "I know an old lady who swallowed a horse.",
      "She's dead, of course!",
    ]
    FoodChain.recite(1, 8).should eq(expected)
  end
end
