# classes

Classes are a central concept in [object-oriented programming][object-oriented-programming].
[In Crystal, everything is an object][everything-is-an-object], every object has a type, and it can respond to some methods.
Classes are blueprints to create objects, providing initial values for state, like variables, and implementations of behavior, like methods.
Objects are an instance of a class, that hold all the instance variables and states.

## Class definition

A class is defined using the `class` keyword, followed by the name of the class written in `UpperCamelCase`.

```crystal
class Account
end
```

## Creating an instance

To [create an instance of a class][new-initialize], you call the class name with the `new` method.

```crystal
class Account
end

account = Account.new
```

In the example above the variable `account` is an instance of the class `Account`.

When creating an instance, there is a special method called `initialize` that acts as a constructor.
It is called when an instance is created.
The constructor allows you to set the initial state of the instance.
The `initialize` method can take arguments, which are passed when creating an instance.

```crystal
class Account
  def initialize(number)
    5 + number # => 9
  end
end

Account.new(4)
```

~~~~exercism/note
The `initialize` method cannot manually return a value, instead, `new` returns the newly created instance.

```crystal
class Account
  def initialize(number)
    5 + number
  end
end

Account.new(4)
# => #<Account:0x7f5dc33dcea0>
```
~~~~

## Instance methods

An instance method is a method that is available to an instance of a class, and can be called on that instance.
Instance methods are defined using the `def` keyword, followed by the name of the method. They are defined inside the class definition.

```crystal
class Account
  def balance
    100
  end
end

account = Account.new
account.balance # => 100
```

## Instance variables

[Instance variables][instance-variable] are variables that are available in all methods of the instance.
To access an instance variable you need to define an instance method.
They can be initialized in the `initialize` method.
They are defined using the `@` prefix.

```crystal
class Account
  def initialize
    @balance = 100
  end

  def balance
    @balance
  end
end

account = Account.new
account.balance
# => 100
```

Instance variables may also be defined inside the class definition.

```crystal
class Account
  @age = 0
end
```

### Instance variables with initialization

Instance variables can be initialized with an argument passed to the `initialize` method.
Since Crystal can't infer the type of an argument during initialization, it needs to be specified.
If you want to read more about this, you can read: [type-inference][type-inference].
To specify the type of the variable you can use the `:` symbol, followed by the type.
For example, if you want to create an instance variable called `balance` of type `Int32`, you can do the following: `@balance : Int32`.
Or if you want to create an instance variable called `raining` of type `Bool`, you can do the following: `@raining : Bool`.

There are a few ways to implement this, either by in the `initialize` method declaring the argument with the type, and then assigning the instance variable to the argument, like the following example:

```crystal
class Account
  def initialize(balance : Int32)
    @balance = balance
  end

  def balance
    @balance
  end
end

account = Account.new(1)
account_2 = Account.new(5)

account.balance
# => 1

account_2.balance
# => 5
```

Another way is to declare the instance variable type in the class definition in the form: `@<variable> : <Type>`, like the following example:

```crystal
class Weather

  @raining : Bool

  def initialize(raining)
    @raining = raining
  end

  def raining
    @raining
  end
end

weather = Weather.new(true)
weather.raining
# => true
```

## Modify instance variables

Instance variables can be modified by methods.
These methods can be called on the instance of the class.
When a method modifies an instance variable, that change is only available in the instance of the class you called it on.

```crystal
class Account
  def initialize(balance : Int32)
    @balance = balance
  end

  def withdraw(amount)
    @balance -= amount
  end

  def balance
    @balance
  end
end

account = Account.new(10)
account_2 = Account.new(10)
account.balance
# => 10

account_2.balance
# => 10

account.withdraw(5)
account.balance
# => 5

account_2.balance
# => 10
```

## Class methods

[Class methods][class-methods], are methods that are defined on a class, but not on the instances of that class.
They offer a way to create methods that are not dependent on the state of the instance.
They are defined using the `def` keyword, followed by `self.<method name>`.
`self` is a reference to the namespace which self is being called from.
In this case, it is a reference to the class, `Account`.
It would be the same as if you would have written `Account.`, but `self.` is the preferred way to do it.

```crystal
class Account
  def self.balance
    100
  end
end

Account.balance
# => 100
```

[object-oriented-programming]: https://en.wikipedia.org/wiki/Object-oriented_programming
[everything-is-an-object]: https://crystal-lang.org/reference/latest/syntax_and_semantics/everything_is_an_object.html
[new-initialize]: https://crystal-lang.org/reference/latest/syntax_and_semantics/new%2C_initialize_and_allocate.html
[instance-variable]: https://crystal-lang.org/reference/latest/syntax_and_semantics/instance_variables.html
[type-inference]: https://crystal-lang.org/reference/latest/syntax_and_semantics/type_inference.html
[class-methods]: https://crystal-lang.org/reference/latest/syntax_and_semantics/class_methods.html
