# The `TestDSL` mixin provides a DSL of sorts, implemented using macros,
# for automatically defining the *test_description*, *test_workload* (in
# addition to attributes related to expect_raises). It intentionally
# resembles the RSpec DSL.
#
# NOTE: Use of the included macros are entirely optional. One may choose
#       to simply override the *test_description* and *test_workload* methods
#       a given `Exercise::TestCase` including-type instead.
module TestDSL
  macro included
    PROPERTIES = {} of Nil => Nil

    macro finished
      add_methods
    end
  end

  # For example:
  #
  # ```
  # _it "should #{description}" do
  #   "HelloWorld.hello.should eq(\"Hello, World!\")"
  # end
  # ```
  #
  # Results in the following methods at compile time:
  #
  # ```
  # def test_description
  #   "should #{description}"
  # end
  #
  # def test_workload
  #   "HelloWorld.hello.should eq(\"'Hello, World!\")"
  # end
  # ```
  macro _it(desc, &block)
    {% PROPERTIES[:description] = desc %}
    {% PROPERTIES[:workload] = block.body %}
  end

  # Example:
  #
  # ```
  # _expect_raises(ArgumentError, /.+/) do
  #   "HelloWorld.hello"
  # end
  # ```
  #
  # Resulting in
  macro _expect_raises(type = ArugumentError, with_message = nil, &block)
    {% PROPERTIES[:expect_raises_type] = type %}
    {% PROPERTIES[:expect_raises_trigger] = block.body || nil %}
    {% PROPERTIES[:expect_raises_message] = with_message %}
  end

  macro add_methods
    def test_description
      {{ PROPERTIES[:description] }}
    end

    def test_workload
      if !should_raise?
        {{ PROPERTIES[:workload] }}
      else
        {% _type = PROPERTIES[:expect_raises_type] %}
        {% _regex = PROPERTIES[:expect_raises_regex] %}
        {% _trigger = PROPERTIES[:expect_raises_trigger] %}
        "expect_raises(#{{{ _type }}}#{{{ _regex }} ? ", /#{{{ _regex }}}/" : ""}) do\n" +
        "    #{{{ _trigger }}}\n" +
        "  end"
      end
    end
  end

  # Including types should override the *should_raise?* method so that the generated
  # *test_workload* method can determine when the *expect_raises" form of a unit test
  # should be used and when applicable to the exercise.
  def should_raise?
    false
  end
end
