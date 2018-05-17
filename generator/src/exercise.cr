require "json"

require "./renderable"
require "./test_dsl"

module Exercise
  # A `Spec` represents the root node of an exercise's canonical-data.
  #
  # It provides a fixed `JSON.mapping` consistent with the canonical-data.json schema.
  struct Spec(T)
    include Renderable

    JSON.mapping({
      exercise: String,
      version:  String,
      comments: { type: Array(String), nilable: true },
      cases:    Array(T | TestGroup(T)),
    })

    # The most common entrypoint for exercise generation, the *from_canonical*
    # class method takes a string representation of the canonical-data json,
    # passes it to *from_json* and uses the resulting object to push additional
    # settings down into subordinates types (i.e. `TestGroup` and `TestCase`) for
    # use in ECR template and supporting methods (see `Spec.inject` for more info).
    def self.from_canonical(data)
       inject from_json(data)
    end

    # Injects references and data into subordinate `TestCase` and `TestGroup` instances.
    # This method must be invoked to link `Spec` instances with subordinate `TestGroup`
    # and `TesCase` objects, and the easiest way to do that is to create an instance using
    # `Spec.from_canonical`.
    private def self.inject(instance)
      # Set a reference to this Exercise instance for all TestGroup and Test instances.
      instance.cases.map do |c|
        c.parent = instance
        c.cases.map { |_c| _c.parent = instance } if c.responds_to? :cases
      end

      # Enable the first test case. This will pass through
      # a `TestGroup`, if present, to the first `TestCase` instance.
      instance.cases.first.test_prefix = "it"

      # Removes whitespace between the last
      # item of each group and the surrounding block.
      instance.cases.last.delimiter = ""
      instance.cases.each do |c|
        c.cases.last.delimiter = "" if c.responds_to? :cases
      end

      instance
    end

    # Returns a CamelCase version of the exercise name for use in a `TestCase`.
    def test_class
      exercise.split('-').map(&.capitalize).join
    end

    template_filename "exercise.tt"
  end

  # A `TestGroup` is a collection of `TestCase` groups.
  class TestGroup(T)
    include Renderable

    property parent : Spec(T)? = nil

    JSON.mapping({
      description: String,
      comments:    { type: Array(String), nilable: true },
      cases:       Array(T | TestGroup(T)),
    })

    # Allows passing a value to the *test_prefix* attribute of the first `TestCase`
    # known to this `TestGroup` instance; it is used to enable only the first test
    # case (with "it"), while continuing to disable ("pending") all others during
    # spec rendering.
    def test_prefix=(prefix)
      cases.first.test_prefix = prefix
    end

    # The method call to perform for this group of `TestCase` instances (effectively
    # a pass-thru to the first test case in this `TestGroup`).
    def test_method
      cases.first.test_method
    end

    # The value used as the description of the encompassing "describe" for this group
    # of `TestCase` instances (effectively a pass-thru to the first test case in this `TestGroup`).
    def group_description
      cases.first.group_description
    end

    template_filename "test_group.tt"
  end

  # The `TestCase` mixin represents an individual unit test to be rendered to the resulting
  # spec file. It should be included by a user-implemented class that provides additional
  # instructions for rendering.
  module TestCase(In, Out)
    include Renderable

    macro included
      property parent : Exercise::Spec({{ @type }})? = nil
    end

    property test_prefix : String = "pending"
    property group_description : String? = nil

    JSON.mapping({
      description: String,
      comments:    { type: Array(String), nilable: true },
      property:    String,
      input:       In,
      expected:    Out,
    })

    # Returns the *test_class* value for the related `Spec` object; represents the
    # name of the class under test (e.g. hello-world -> HelloWorld).
    def test_class
      "#{parent.try &.test_class}"
    end

    # A wrapper around the *property* attribute found in this exercise's canonical-data.json,
    # properly downcased and underscored. Can be overridden in subclasses, if desired.
    def test_method
      property.gsub(/([a-z])([A-Z])/, "\\1_\\2").downcase
    end

    template_filename "test_case.tt"
  end
end
