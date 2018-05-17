module Nested
  macro array(name, element_type, depth=5)
    {% out = "" %}
    {% for i in (1..depth) %}
      {% out = out + "Array(#{element_type} | " %}
    {% end %}
    {% out = out + "Array(#{element_type})" %}
    {% for i in (1..depth) %}
      {% out = out + ")" %}
    {% end %}
    alias {{ name.id }} = {{ out.id }}
  end
end
