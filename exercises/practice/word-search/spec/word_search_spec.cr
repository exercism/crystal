require "spec"
require "../src/*"

describe WordSearch do
  it "Should accept an initial game grid and a target search word" do
    grid = [
      "jefblpepre",
    ]
    words = [
      "clojure",
    ]
    expected = {
      "clojure" => nil,
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate one word written left to right" do
    grid = [
      "clojurermt",
    ]
    words = [
      "clojure",
    ]
    expected = {
      "clojure" => { {1, 1}, {7, 1} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate the same word written left to right in a different position" do
    grid = [
      "mtclojurer",
    ]
    words = [
      "clojure",
    ]
    expected = {
      "clojure" => { {3, 1}, {9, 1} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate a different left to right word" do
    grid = [
      "coffeelplx",
    ]
    words = [
      "coffee",
    ]
    expected = {
      "coffee" => { {1, 1}, {6, 1} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate that different left to right word in a different position" do
    grid = [
      "xcoffeezlp",
    ]
    words = [
      "coffee",
    ]
    expected = {
      "coffee" => { {2, 1}, {7, 1} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate a left to right word in two line grid" do
    grid = [
      "jefblpepre",
      "tclojurerm",
    ]
    words = [
      "clojure",
    ]
    expected = {
      "clojure" => { {2, 2}, {8, 2} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate a left to right word in three line grid" do
    grid = [
      "camdcimgtc",
      "jefblpepre",
      "clojurermt",
    ]
    words = [
      "clojure",
    ]
    expected = {
      "clojure" => { {1, 3}, {7, 3} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate a left to right word in ten line grid" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
    ]
    expected = {
      "clojure" => { {1, 10}, {7, 10} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate that left to right word in a different position in a ten line grid" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "clojurermt",
      "jalaycalmp",
    ]
    words = [
      "clojure",
    ]
    expected = {
      "clojure" => { {1, 9}, {7, 9} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate a different left to right word in a ten line grid" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "fortranftw",
      "alxhpburyi",
      "clojurermt",
      "jalaycalmp",
    ]
    words = [
      "fortran",
    ]
    expected = {
      "fortran" => { {1, 7}, {7, 7} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate multiple words" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "fortranftw",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "fortran",
      "clojure",
    ]
    expected = {
      "clojure" => { {1, 10}, {7, 10} },
      "fortran" => { {1, 7}, {7, 7} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate a single word written right to left" do
    grid = [
      "rixilelhrs",
    ]
    words = [
      "elixir",
    ]
    expected = {
      "elixir" => { {6, 1}, {1, 1} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate multiple words written in different horizontal directions" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "elixir",
      "clojure",
    ]
    expected = {
      "clojure" => { {1, 10}, {7, 10} },
      "elixir"  => { {6, 5}, {1, 5} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate words written top to bottom" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
      "elixir",
      "ecmascript",
    ]
    expected = {
      "clojure"    => { {1, 10}, {7, 10} },
      "elixir"     => { {6, 5}, {1, 5} },
      "ecmascript" => { {10, 1}, {10, 10} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate words written bottom to top" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
      "elixir",
      "ecmascript",
      "rust",
    ]
    expected = {
      "clojure"    => { {1, 10}, {7, 10} },
      "elixir"     => { {6, 5}, {1, 5} },
      "ecmascript" => { {10, 1}, {10, 10} },
      "rust"       => { {9, 5}, {9, 2} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate words written top left to bottom right" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
      "elixir",
      "ecmascript",
      "rust",
      "java",
    ]
    expected = {
      "clojure"    => { {1, 10}, {7, 10} },
      "elixir"     => { {6, 5}, {1, 5} },
      "ecmascript" => { {10, 1}, {10, 10} },
      "rust"       => { {9, 5}, {9, 2} },
      "java"       => { {1, 1}, {4, 4} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate words written bottom right to top left" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
      "elixir",
      "ecmascript",
      "rust",
      "java",
      "lua",
    ]
    expected = {
      "clojure"    => { {1, 10}, {7, 10} },
      "elixir"     => { {6, 5}, {1, 5} },
      "ecmascript" => { {10, 1}, {10, 10} },
      "rust"       => { {9, 5}, {9, 2} },
      "java"       => { {1, 1}, {4, 4} },
      "lua"        => { {8, 9}, {6, 7} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate words written bottom left to top right" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
      "elixir",
      "ecmascript",
      "rust",
      "java",
      "lua",
      "lisp",
    ]
    expected = {
      "clojure"    => { {1, 10}, {7, 10} },
      "elixir"     => { {6, 5}, {1, 5} },
      "ecmascript" => { {10, 1}, {10, 10} },
      "rust"       => { {9, 5}, {9, 2} },
      "java"       => { {1, 1}, {4, 4} },
      "lua"        => { {8, 9}, {6, 7} },
      "lisp"       => { {3, 6}, {6, 3} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should locate words written top right to bottom left" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
      "elixir",
      "ecmascript",
      "rust",
      "java",
      "lua",
      "lisp",
      "ruby",
    ]
    expected = {
      "clojure"    => { {1, 10}, {7, 10} },
      "elixir"     => { {6, 5}, {1, 5} },
      "ecmascript" => { {10, 1}, {10, 10} },
      "rust"       => { {9, 5}, {9, 2} },
      "java"       => { {1, 1}, {4, 4} },
      "lua"        => { {8, 9}, {6, 7} },
      "lisp"       => { {3, 6}, {6, 3} },
      "ruby"       => { {8, 6}, {5, 9} },
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should fail to locate a word that is not in the puzzle" do
    grid = [
      "jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt",
    ]
    words = [
      "clojure",
      "elixir",
      "ecmascript",
      "rust",
      "java",
      "lua",
      "lisp",
      "ruby",
      "haskell",
    ]
    expected = {
      "clojure"    => { {1, 10}, {7, 10} },
      "elixir"     => { {6, 5}, {1, 5} },
      "ecmascript" => { {10, 1}, {10, 10} },
      "rust"       => { {9, 5}, {9, 2} },
      "java"       => { {1, 1}, {4, 4} },
      "lua"        => { {8, 9}, {6, 7} },
      "lisp"       => { {3, 6}, {6, 3} },
      "ruby"       => { {8, 6}, {5, 9} },
      "haskell"    => nil,
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should fail to locate words that are not on horizontal, vertical, or diagonal lines" do
    grid = [
      "abc",
      "def",
    ]
    words = [
      "aef",
      "ced",
      "abf",
      "cbd",
    ]
    expected = {
      "aef" => nil,
      "ced" => nil,
      "abf" => nil,
      "cbd" => nil,
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should not concatenate different lines to find a horizontal word" do
    grid = [
      "abceli",
      "xirdfg",
    ]
    words = [
      "elixir",
    ]
    expected = {
      "elixir" => nil,
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should not wrap around horizontally to find a word" do
    grid = [
      "silabcdefp",
    ]
    words = [
      "lisp",
    ]
    expected = {
      "lisp" => nil,
    }
    WordSearch.search(grid, words).should eq(expected)
  end

  pending "Should not wrap around vertically to find a word" do
    grid = [
      "s",
      "u",
      "r",
      "a",
      "b",
      "c",
      "t",
    ]
    words = [
      "rust",
    ]
    expected = {
      "rust" => nil,
    }
    WordSearch.search(grid, words).should eq(expected)
  end
end
