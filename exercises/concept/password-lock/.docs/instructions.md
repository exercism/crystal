# Instructions

The company you work for is just about to launch its brand new smartphone, called the **Smarty 5**, it features a brand new camera system, a new design, and a revolutionary new processor running on a new operating system called **smartyOS**.

The new processor has the power to handle more secure passwords than ever before, and the company has decided to use this to its advantage.
They have asked you to implement a password lock system for the phone that will allow the user to set a password and then check if a given password is correct.

~~~~exercism/caution
The password system practiced in this exercise is not secure and is only used for educational purposes.
It should **NOT** be used in any real-world applications.
~~~~

## 1. Set a password

The phone allows users to use multiple different types of passwords, from a simple digit password to a more secure alphanumeric password and even a password that stores their fingerprint.

These different types of passwords use different types: the digit password uses an `Int32`, the alphanumeric password uses a `String`, and the fingerprint password uses a `Float64`.

Implement the class `PasswordLock` with an initializer that takes any of the three types of passwords as an argument and stores it in an instance variable called `@password`.

```crystal
password_lock = PasswordLock.new(1234)
# => #<PasswordLock:0x7f8e1b8c0b80 @password=1234>
```

## 2. Encrypt the password

The company has decided to encrypt the password so that it is not stored in plain text and has asked you to implement a method for encrypting it.

Each password type has its unique way of being encrypted:

- `Int32` password: The password is divided by two and rounded to the nearest integer.
- `String` password: The password is reversed.
- `Float64` password: The password is multiplied by four.

Implement an instance method called `encrypt` that takes no arguments and modifies the `@password` instance variable so that it is encrypted.

```crystal
password_lock = PasswordLock.new(1234)
# => #<PasswordLock:0x7f8e1b8c0b80 @password=1234>

password_lock.encrypt
# => #<PasswordLock:0x7f8e1b8c0b80 @password=617>
```

## 3. Check if a password is correct

The company has also asked you to implement a method that checks if a given password is correct.

They want the method to return `nil` if the password is incorrect and `"Unlocked"` if the password is correct.

Implement an instance method called `unlock?` that takes the password to check as an argument.
The method should return `nil` if the password is incorrect and `"Unlocked"` if the password is correct.

```crystal
password_lock = PasswordLock.new(1234)
password_lock.encrypt
password_lock.unlock?(1234)
# => "Unlocked"
```
