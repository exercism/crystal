require "spec"
require "../src/*"

describe "Grep" do
  it "One file, one match, no flags" do
    expected = "Of Atreus, Agamemnon, King of men."
    pattern = "Agamemnon"
    flags = [] of String
    files = ["iliad.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, one match, print line numbers flag" do
    expected = "2:Of that Forbidden Tree, whose mortal tast"
    pattern = "Forbidden"
    flags = ["-n"]
    files = ["paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, one match, case-insensitive flag" do
    expected = "Of that Forbidden Tree, whose mortal tast"
    pattern = "FORBIDDEN"
    flags = ["-i"]
    files = ["paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, one match, print file names flag" do
    expected = "paradise-lost.txt"
    pattern = "Forbidden"
    flags = ["-l"]
    files = ["paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, one match, match entire lines flag" do
    expected = "With loss of Eden, till one greater Man"
    pattern = "With loss of Eden, till one greater Man"
    flags = ["-x"]
    files = ["paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, one match, multiple flags" do
    expected = "9:Of Atreus, Agamemnon, King of men."
    pattern = "OF ATREUS, Agamemnon, KIng of MEN."
    flags = ["-n", "-i", "-x"]
    files = ["iliad.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, several matches, no flags" do
    expected = "Nor how it may concern my modesty,
But I beseech your grace that I may know
The worst that may befall me in this case,"
    pattern = "may"
    flags = [] of String
    files = ["midsummer-night.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, several matches, print line numbers flag" do
    expected = "3:Nor how it may concern my modesty,
5:But I beseech your grace that I may know
6:The worst that may befall me in this case,"
    pattern = "may"
    flags = ["-n"]
    files = ["midsummer-night.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, several matches, match entire lines flag" do
    expected = ""
    pattern = "may"
    flags = ["-x"]
    files = ["midsummer-night.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, several matches, case-insensitive flag" do
    expected = "Achilles sing, O Goddess! Peleus' son;
The noble Chief Achilles from the son"
    pattern = "ACHILLES"
    flags = ["-i"]
    files = ["iliad.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, several matches, inverted flag" do
    expected = "Brought Death into the World, and all our woe,
With loss of Eden, till one greater Man
Restore us, and regain the blissful Seat,
Sing Heav'nly Muse, that on the secret top
That Shepherd, who first taught the chosen Seed"
    pattern = "Of"
    flags = ["-v"]
    files = ["paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, no matches, various flags" do
    expected = ""
    pattern = "Gandalf"
    flags = ["-n", "-l", "-x", "-i"]
    files = ["iliad.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, one match, file flag takes precedence over line flag" do
    expected = "iliad.txt"
    pattern = "ten"
    flags = ["-n", "-l"]
    files = ["iliad.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "One file, several matches, inverted and match entire lines flags" do
    expected = "Achilles sing, O Goddess! Peleus' son;
His wrath pernicious, who ten thousand woes
Caused to Achaia's host, sent many a soul
And Heroes gave (so stood the will of Jove)
To dogs and to all ravening fowls a prey,
When fierce dispute had separated once
The noble Chief Achilles from the son
Of Atreus, Agamemnon, King of men."
    pattern = "Illustrious into Ades premature,"
    flags = ["-x", "-v"]
    files = ["iliad.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, one match, no flags" do
    expected = "iliad.txt:Of Atreus, Agamemnon, King of men."
    pattern = "Agamemnon"
    flags = [] of String
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, several matches, no flags" do
    expected = "midsummer-night.txt:Nor how it may concern my modesty,
midsummer-night.txt:But I beseech your grace that I may know
midsummer-night.txt:The worst that may befall me in this case,"
    pattern = "may"
    flags = [] of String
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, several matches, print line numbers flag" do
    expected = "midsummer-night.txt:5:But I beseech your grace that I may know
midsummer-night.txt:6:The worst that may befall me in this case,
paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast
paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top"
    pattern = "that"
    flags = ["-n"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, one match, print file names flag" do
    expected = "iliad.txt
paradise-lost.txt"
    pattern = "who"
    flags = ["-l"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, several matches, case-insensitive flag" do
    expected = "iliad.txt:Caused to Achaia's host, sent many a soul
iliad.txt:Illustrious into Ades premature,
iliad.txt:And Heroes gave (so stood the will of Jove)
iliad.txt:To dogs and to all ravening fowls a prey,
midsummer-night.txt:I do entreat your grace to pardon me.
midsummer-night.txt:In such a presence here to plead my thoughts;
midsummer-night.txt:If I refuse to wed Demetrius.
paradise-lost.txt:Brought Death into the World, and all our woe,
paradise-lost.txt:Restore us, and regain the blissful Seat,
paradise-lost.txt:Sing Heav'nly Muse, that on the secret top"
    pattern = "TO"
    flags = ["-i"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, several matches, inverted flag" do
    expected = "iliad.txt:Achilles sing, O Goddess! Peleus' son;
iliad.txt:The noble Chief Achilles from the son
midsummer-night.txt:If I refuse to wed Demetrius."
    pattern = "a"
    flags = ["-v"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, one match, match entire lines flag" do
    expected = "midsummer-night.txt:But I beseech your grace that I may know"
    pattern = "But I beseech your grace that I may know"
    flags = ["-x"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, one match, multiple flags" do
    expected = "paradise-lost.txt:4:With loss of Eden, till one greater Man"
    pattern = "WITH LOSS OF EDEN, TILL ONE GREATER MAN"
    flags = ["-n", "-i", "-x"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, no matches, various flags" do
    expected = ""
    pattern = "Frodo"
    flags = ["-n", "-l", "-x", "-i"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, several matches, file flag takes precedence over line number flag" do
    expected = "iliad.txt
paradise-lost.txt"
    pattern = "who"
    flags = ["-n", "-l"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end

  pending "Multiple files, several matches, inverted and match entire lines flags" do
    expected = "iliad.txt:Achilles sing, O Goddess! Peleus' son;
iliad.txt:His wrath pernicious, who ten thousand woes
iliad.txt:Caused to Achaia's host, sent many a soul
iliad.txt:And Heroes gave (so stood the will of Jove)
iliad.txt:To dogs and to all ravening fowls a prey,
iliad.txt:When fierce dispute had separated once
iliad.txt:The noble Chief Achilles from the son
iliad.txt:Of Atreus, Agamemnon, King of men.
midsummer-night.txt:I do entreat your grace to pardon me.
midsummer-night.txt:I know not by what power I am made bold,
midsummer-night.txt:Nor how it may concern my modesty,
midsummer-night.txt:In such a presence here to plead my thoughts;
midsummer-night.txt:But I beseech your grace that I may know
midsummer-night.txt:The worst that may befall me in this case,
midsummer-night.txt:If I refuse to wed Demetrius.
paradise-lost.txt:Of Mans First Disobedience, and the Fruit
paradise-lost.txt:Of that Forbidden Tree, whose mortal tast
paradise-lost.txt:Brought Death into the World, and all our woe,
paradise-lost.txt:With loss of Eden, till one greater Man
paradise-lost.txt:Restore us, and regain the blissful Seat,
paradise-lost.txt:Sing Heav'nly Muse, that on the secret top
paradise-lost.txt:Of Oreb, or of Sinai, didst inspire
paradise-lost.txt:That Shepherd, who first taught the chosen Seed"
    pattern = "Illustrious into Ades premature,"
    flags = ["-x", "-v"]
    files = ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"]

    Grep.search(pattern, flags, files).should eq(expected)
  end
end
