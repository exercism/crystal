# Modules

[Modules][modules] in Crystal serve 2 purposes:

The first purpose is to create a [namespace][namespace] to avoid name collisions.
But it also forms as a form of grouping code together, this is to make it easier to understand what the code is for.

The second purpose is to define [mixins][mixin] to share code to types.

Modules have similarities to classes, but the main difference is that modules cannot be instantiated, and thereby don't have instance variables.

To declare a module you use the `module` keyword followed by the name of the module.

```crystal
module Foo
end
```

new change



## Namespace

A namespace is a way to group code together, this is to avoid name clashes, but also to make it easier to understand what the code is for.
When wanting to access for example a constant or a class that has been placed inside a namespace you use the `::` operator.

```crystal
module Foo
  class Bar
  end
end

Foo::Bar.new
```

## Use it as a mixin

This can be useful when, for example, wanting multiple classes to have the same "base" functionality or when wanting to share code between classes that are not related.
Or when wanting to share code between classes that are not related.

There are 2 different ways to use a module as a mixin: the first one is to use the `include` keyword, the second one is to use the `extend` keyword.

Both methods will make constants available to the type that includes or extends the module.

### Include

Include will make all methods in the module available as instance methods on the type that includes the module.
The `include` keyword should be written at the top of the type, followed by the name of the module.

```crystal
module Foo
  def foo
    "foo"
  end
end

class Bar
  include Foo
end

Bar.new.foo # => "foo"
```

### Extend

Extend works similarly to include, but instead of making the methods available as instance methods, it makes them available as class methods.
The `extend` keyword should be written at the top of the type followed by the name of the module.

```crystal
module Foo
  def foo
    "foo"
  end
end

class Bar
  extend Foo
end

Bar.foo # => "foo"
```

## Extend self

A quite common pattern in Crystal is to use the [`extend self`][extend self] pattern, in a module.
This will make all methods in the module available as class methods on the module itself.
This means you don't have to assign each method to the module itself using the `def self.method_name` syntax.


```crystal
module Foo
  extend self

  def foo
    "foo"
  end
end

Foo.foo # => "foo"
```

[mixin]: https://en.wikipedia.org/wiki/Mixin
[modules]: https://crystal-lang.org/reference/syntax_and_semantics/modules.html
[extend self]: https://crystal-lang.org/reference/syntax_and_semantics/modules.html#extend-self
[namespace]: https://en.wikipedia.org/wiki/Namespace
