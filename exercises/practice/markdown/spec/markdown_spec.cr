require "spec"
require "../src/*"

describe "Markdown" do
  it "parses normal text as a paragraph" do
    markdown = "This will be a paragraph"
    html = "<p>This will be a paragraph</p>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "parsing italics" do
    markdown = "_This will be italic_"
    html = "<p><em>This will be italic</em></p>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "parsing bold text" do
    markdown = "__This will be bold__"
    html = "<p><strong>This will be bold</strong></p>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "mixed normal, italics and bold text" do
    markdown = "This will _be_ __mixed__"
    html = "<p>This will <em>be</em> <strong>mixed</strong></p>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with h1 header level" do
    markdown = "# This will be an h1"
    html = "<h1>This will be an h1</h1>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with h2 header level" do
    markdown = "## This will be an h2"
    html = "<h2>This will be an h2</h2>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with h3 header level" do
    markdown = "### This will be an h3"
    html = "<h3>This will be an h3</h3>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with h4 header level" do
    markdown = "#### This will be an h4"
    html = "<h4>This will be an h4</h4>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with h5 header level" do
    markdown = "##### This will be an h5"
    html = "<h5>This will be an h5</h5>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with h6 header level" do
    markdown = "###### This will be an h6"
    html = "<h6>This will be an h6</h6>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "h7 header level is a paragraph" do
    markdown = "####### This will not be an h7"
    html = "<p>####### This will not be an h7</p>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "unordered lists" do
    markdown = "* Item 1
* Item 2"
    html = "<ul><li>Item 1</li><li>Item 2</li></ul>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "With a little bit of everything" do
    markdown = "# Header!
* __Bold Item__
* _Italic Item_"
    html = "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with markdown symbols in the header text that should not be interpreted" do
    markdown = "# This is a header with # and * in the text"
    html = "<h1>This is a header with # and * in the text</h1>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with markdown symbols in the list item text that should not be interpreted" do
    markdown = "* Item 1 with a # in the text
* Item 2 with * in the text"
    html = "<ul><li>Item 1 with a # in the text</li><li>Item 2 with * in the text</li></ul>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "with markdown symbols in the paragraph text that should not be interpreted" do
    markdown = "This is a paragraph with # and * in the text"
    html = "<p>This is a paragraph with # and * in the text</p>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end

  pending "unordered lists close properly with preceding and following lines" do
    markdown = "# Start a list
* Item 1
* Item 2
End a list"
    html = "<h1>Start a list</h1><ul><li>Item 1</li><li>Item 2</li></ul><p>End a list</p>"

    parser = Markdown.new(markdown)
    parser.to_html.should eq(html)
  end
end
