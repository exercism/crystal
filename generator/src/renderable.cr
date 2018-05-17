require "ecr"

# The `Renderable` mixin allows for rendering an ECR template for including types
# using a fixed default location. Essentially, it is just a wrapper for the
# `ECR.def_to_s` macro, with features to alter the template path at compile time.
#
# For example:
#
# Given the following ecr template:
#
# ```text
# # /tmp/templates/whatever.tt
# ~~<%= workload %>~~
# ```
#
# ```
# class Whatever
#   include Renderable
#
#   template_directory /tmp/templates
#   template_filename "tmp.tt"
#
#   def workload
#      "whatever"
#   end
# end
#
# Whatever.new.to_s  # => ~~whatever~~
# ```
module Renderable
  INDENT = "  "
  DEFAULT_TEMPLATES = "#{__DIR__}/templates"

  property delimiter : String = "\n"

  macro included
    PATH = [{{ DEFAULT_TEMPLATES }}]

    macro finished
      template_filename "default.tt"
    end
  end

  # Overrides the default ecr template path.
  macro template_directory(path)
    {% PATH[0] = path.gsub(/\/$/, "") %}
  end

  # Wraps the `ECR.def_to_s` macro. This macro may only be used
  # once per including type. Subsequent calls will have no effect.
  macro template_filename(path)
    {% if PATH.size < 2 %}
      {% PATH << path %}
      ECR.def_to_s {{ PATH.join "/" }}
    {% end %}
  end

  # Provides a convenient indentation helper for nested ECR templates.
  def indent(indent_level : Int32 = 0)
    to_s.split("\n").map do |line|
      line.strip.blank? ? "" : "#{INDENT * indent_level}#{line}"
    end.join("\n").rstrip + delimiter
  end
end
