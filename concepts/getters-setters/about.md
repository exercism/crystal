# Getters and setters

Getters and setters are methods that allow you to read and write the value of an object's property.
Crystal has macros, which makes it easy to define getters and setters for a property.
Macros are a way to generate code at compile time, which will be covered later in the macro concept.

In Ruby these methods are defined using the `attr_reader`, `attr_writer` and `attr_accessor` methods and are very similar to Crystals implementation on the surface.
Crystal has defined these as `getter`, `setter` and `property` macros.

## Getters

Getter is a macro that defines a method that returns the value of an instance variable.
This means that you no longer have to write `@` in front of the instance variable when you want to access it (in methods, excluding initialize); instead, you can call the method that the getter macro has defined.

The getter macro can accept multiple instance variables by separating them with commas.

```crystal
# This:
class Person
  @name : String
  @age : Int32

  def name
    @name
  end

  def age
    @age
  end
end

# Is the same as this:
class Person
  @name : String
  @age : Int32

  getter name, :age
end
```

As you can see, using getter reduces the amount of code you write and makes it easier to read.
Also, Ruby and Crystal differ in that Crystal accepts both the variable name and symbol as arguments for the getter macro.
Symbols will be covered later in the symbol concept.

## Setters

Setter is a macro that defines a method that sets the value of an instance variable.
This macro isn't that often found and is commonly the `property` macro used instead.
The methods that will be created will look like `name_of_method=`; the `=` is what makes it so the property can be set.

This method definition is a bit special since the argument the method receives is after the `=` sign.
Several other special methods in Crystal use this syntax, like the `+` method.

As with the getter macro, when you want to update the value of an instance variable after defining a setter, you can call the method that the setter macro has defined.

```crystal
# This:
class Person
  @name : String
  @age : Int32

  def name=(name : String)
    @name = name
  end

  def age=(age : Int32)
    @age = age
  end
end

# Is the same as this:
class Person
  @name : String
  @age : Int32

  setter name, :age
end
```

## Property

Property is a macro that defines both a getter and a setter for an instance variable.

```crystal
class Person
  @name : String
  @age : Int32

  property name, :age
end
```

[getters_and_macros]: https://crystal-lang.org/reference/syntax_and_semantics/methods_and_instance_variables.html#getters-and-setters
[getter]: https://crystal-lang.org/api/Object.html#getter%28%2Anames%2C%26block%29-macro
[setter]: https://crystal-lang.org/api/Object.html#setter%28%2Anames%29-macro
[property]: https://crystal-lang.org/api/Object.html#property%28%2Anames%2C%26block%29-macro
