# Instructions

Bellebrook basketball league is a league of multiple teams, each with a roster of players.
A new season is about to start, and they need to create a new ticketing system to sell tickets for the games.
Last season they sold tickets at the entrance of the stadium, but popularity has exploded and they have decided to sell tickets online this season to handle the increased demand.

The league has contacted you and asked you to create a system that can handle the ticket sales.

## 1. Create a ticketing system

First, you need to create a ticketing system that can handle the ticket sales.
The ticketing system has to tell how many tickets are available for a given game.

For each game an instance of a class called `TicketSystem` should be created.
The initialized state should hold the following information:

1. How many tickets there are available for the game.
2. Which stadium the game is played at.

Construct an initialized state from arguments indicating the amount of tickets available and which stadium the match is played at.
The initialized state should consist of the instance variables `@tickets_available` and `@stadium`.
These should contain the first and second arguments given, respectively.

```crystal
TicketSystem.new(100, "Bellebrook")
# => #<TicketSystem:0x10f0b8 @tickets_available=100, @stadium="Bellebrook">
```

## 2. Get amounts of tickets available

First, you need to create a method that returns the amount of tickets available for a given game.

Define a module with the name `TicketingReservation` above the already defined class.
This module should be included in the `TicketSystem` class.

Inside the module define a method called `tickets_available`.
This method should return the amount of tickets available.

```crystal
ticket_system = TicketSystem.new(100)
ticket_system.tickets_available
#=> 100
```

## 3. Order tickets

You must create a method that checks if there is tickets available for a given game.
The game needs to have 100 tickets in reserve.
This is to make sure that there are always tickets available for the people who buy tickets at the entrance of the stadium.

Inside the module `TicketingReservation`, define a method called `order_ticket?`.
The method should return `true` if there are at least 100 tickets available and `false` otherwise.
If there are at least 100 tickets available, the method should also decrease the amount of tickets available by 1.

```crystal
ticket_system = TicketSystem.new(100)
ticket_system.order_ticket?
#=> true
```

## 4. Order message

The ticketing system has to have easy to understand messages for the users.
And the messages should feel personal, so they should include the user's name.

If the ticket purchase was successful, the user should get a message telling them that the purchase was successful, their ticket number, and which stadium the game is played at.
The ticket number should be the number of tickets available before the order.

If the purchase was successful, the message should look like this: `{name}, your purchase was successful, your ticket number is #{ticket_number}, and the game is played at the {stadium_number} stadium.`.
If the purchase was unsuccessful, the message should look like this: `{name}, your purchase was unsuccessful, there are not enough tickets available.`.

Inside the module `TicketingReservation`, define a method called `order_message` that takes an argument `name` that holds the purchaser's name.
The method should return a string with the message.

```crystal
ticket_system = TicketSystem.new(100, "Bellebrook")
ticket_system.order_message("John")
#=> "John, your purchase was successful, your ticket number is #100, and the game is played at the Bellebrook stadium."
```
