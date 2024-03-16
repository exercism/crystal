module FoodChain
  def self.recite(start : Int, finish : Int) : Array(String)
    (start - 1..finish - 1)
      .map { |i| self.verse(i) + [""] }
      .flatten[0..-2]
  end

  private record Thing, type : String, why : String?, quip : String?

  private def self.verse(which)
    verse = [
      "I know an old lady who swallowed a #{THINGS[which].type}.",
    ]

    if quip = THINGS[which].quip
      verse.push quip
    end

    if which != THINGS.size - 1
      (which..0).step(-1).each do |i|
        verse.push THINGS[i].why || "She swallowed the #{THINGS[i].type} to catch the #{THINGS[i - 1].type}."
      end
    end

    verse
  end

  THINGS = [
    Thing.new(
      type: "fly",
      why: "I don't know why she swallowed the fly. Perhaps she'll die.",
      quip: nil
    ),
    Thing.new(
      type: "spider",
      why: nil,
      quip: "It wriggled and jiggled and tickled inside her."
    ),
    Thing.new(
      type: "bird",
      why: "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
      quip: "How absurd to swallow a bird!"
    ),
    Thing.new(
      type: "cat",
      why: nil,
      quip: "Imagine that, to swallow a cat!"
    ),
    Thing.new(
      type: "dog",
      why: nil,
      quip: "What a hog, to swallow a dog!"
    ),
    Thing.new(
      type: "goat",
      why: nil,
      quip: "Just opened her throat and swallowed a goat!"
    ),
    Thing.new(
      type: "cow",
      why: nil,
      quip: "I don't know how she swallowed a cow!"
    ),
    Thing.new(
      type: "horse",
      why: nil,
      quip: "She's dead, of course!"
    ),
  ]
end
