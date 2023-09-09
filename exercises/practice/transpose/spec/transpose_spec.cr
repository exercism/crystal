require "spec"
require "../src/*"

describe "Transpose" do
  it "empty string" do
    input = ""
    expected = ""
    Transpose.transpose(input).should eq(expected)
  end

  pending "two characters in a row" do
    input = "A1"
    expected = "A\n1"
    Transpose.transpose(input).should eq(expected)
  end

  pending "two characters in a column" do
    input = "A\n1"
    expected = "A1"
    Transpose.transpose(input).should eq(expected)
  end

  pending "simple" do
    input = "ABC\n123"
    expected = "A1\nB2\nC3"
    Transpose.transpose(input).should eq(expected)
  end

  pending "single line" do
    input = "Single line."
    expected = "S\ni\nn\ng\nl\ne\n \nl\ni\nn\ne\n."
    Transpose.transpose(input).should eq(expected)
  end

  pending "first line longer than second line" do
    input = "The fourth line.\nThe fifth line."
    expected = "TT\nhh\nee\n  \nff\noi\nuf\nrt\nth\nh \n l\nli\nin\nne\ne.\n."
    Transpose.transpose(input).should eq(expected)
  end

  pending "second line longer than first line" do
    input = "The first line.\nThe second line."
    expected = "TT\nhh\nee\n  \nfs\nie\nrc\nso\ntn\n d\nl \nil\nni\nen\n.e\n ."
    Transpose.transpose(input).should eq(expected)
  end

  pending "mixed line length" do
    input = "The longest line.\nA long line.\nA longer line.\nA line."
    expected = "TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n."
    Transpose.transpose(input).should eq(expected)
  end

  pending "square" do
    input = "HEART\nEMBER\nABUSE\nRESIN\nTREND"
    expected = "HEART\nEMBER\nABUSE\nRESIN\nTREND"
    Transpose.transpose(input).should eq(expected)
  end

  pending "rectangle" do
    input = "FRACTURE\nOUTLINED\nBLOOMING\nSEPTETTE"
    expected = "FOBS\nRULE\nATOP\nCLOT\nTIME\nUNIT\nRENT\nEDGE"
    Transpose.transpose(input).should eq(expected)
  end

  pending "triangle" do
    input = "T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR"
    expected = "TEASER\n EASER\n  ASER\n   SER\n    ER\n     R"
    Transpose.transpose(input).should eq(expected)
  end

  pending "jagged triangle" do
    input = "11\n2\n3333\n444\n555555\n66666"
    expected = "123456\n1 3456\n  3456\n  3 56\n    56\n    5"
    Transpose.transpose(input).should eq(expected)
  end
end
