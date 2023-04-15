require "spec"
require "../src/*"

describe "Diamond" do
  it "Degenerate case with a single 'A' row" do
    expected = [
      "A",
    ]
    Diamond.rows('A').should eq(expected)
  end

  pending "Degenerate case with no row containing 3 distinct groups of spaces" do
    expected = [
      " A ",
      "B B",
      " A ",
    ]
    Diamond.rows('B').should eq(expected)
  end

  pending "Smallest non-degenerate case with odd diamond side length" do
    expected = [
      "  A  ",
      " B B ",
      "C   C",
      " B B ",
      "  A  ",
    ]
    Diamond.rows('C').should eq(expected)
  end

  pending "Smallest non-degenerate case with even diamond side length" do
    expected = [
      "   A   ",
      "  B B  ",
      " C   C ",
      "D     D",
      " C   C ",
      "  B B  ",
      "   A   ",
    ]
    Diamond.rows('D').should eq(expected)
  end

  pending "Largest possible diamond" do
    expected = [
      "                         A                         ",
      "                        B B                        ",
      "                       C   C                       ",
      "                      D     D                      ",
      "                     E       E                     ",
      "                    F         F                    ",
      "                   G           G                   ",
      "                  H             H                  ",
      "                 I               I                 ",
      "                J                 J                ",
      "               K                   K               ",
      "              L                     L              ",
      "             M                       M             ",
      "            N                         N            ",
      "           O                           O           ",
      "          P                             P          ",
      "         Q                               Q         ",
      "        R                                 R        ",
      "       S                                   S       ",
      "      T                                     T      ",
      "     U                                       U     ",
      "    V                                         V    ",
      "   W                                           W   ",
      "  X                                             X  ",
      " Y                                               Y ",
      "Z                                                 Z",
      " Y                                               Y ",
      "  X                                             X  ",
      "   W                                           W   ",
      "    V                                         V    ",
      "     U                                       U     ",
      "      T                                     T      ",
      "       S                                   S       ",
      "        R                                 R        ",
      "         Q                               Q         ",
      "          P                             P          ",
      "           O                           O           ",
      "            N                         N            ",
      "             M                       M             ",
      "              L                     L              ",
      "               K                   K               ",
      "                J                 J                ",
      "                 I               I                 ",
      "                  H             H                  ",
      "                   G           G                   ",
      "                    F         F                    ",
      "                     E       E                     ",
      "                      D     D                      ",
      "                       C   C                       ",
      "                        B B                        ",
      "                         A                         ",
    ]
    Diamond.rows('Z').should eq(expected)
  end
end
