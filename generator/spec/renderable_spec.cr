require "spec"
require "../src/renderable"

class RenderableTest0
  include Renderable
end

class RenderableTest1
  include Renderable

  private property attr1 = "This is a test file."
  private property attr2 = [1, 2, 3, 4, 5]

  template_directory "#{__DIR__}/fixtures/templates"
  template_filename "test.tt"
end

describe Renderable do
  describe "#to_s" do
    it "should render the default template by default" do
      RenderableTest0.new.to_s.should eq("\n")
    end

    it "should render an overridden template when overridden" do
      RenderableTest1.new.to_s.should match(/This is a test file./)
      RenderableTest1.new.to_s.rstrip.split("\n").size.should eq(6)
    end
  end
end
