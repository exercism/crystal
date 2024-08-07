# Instructions

As a chess enthusiast, you want to write your version of the game.
Yes, there may be plenty of implementations of chess available online already, but yours will be unique!

You start with implementing a basic movement system for the pieces.

The chess game will be played on an eight-square wide and eight-square long board.
The squares are identified by a letter and a number.

## 1. Define rank & file range

The game will have to store the ranks of the board.
The ranks are the rows of the board, and are numbered from 1 to 8.

The game will also have to store the files on the board.
The files are the board's columns and are identified by the letters A to H.

Define the `Chess::RANKS` and `Chess::FILES` constants that store the range of ranks and files respectively.

```crystal
Chess::RANKS
# => 1..8

Chess::FILES
# => 'A'..'H'
```

## 2. Check if square is valid

The game will have to check if a square is valid.
A square is valid if the rank and file are within the ranges of the ranks and files.

Define the `Chess.valid_square?` method that takes the arguments `rank` that holds an int of the rank and `file` that holds a char of the file.
The method should return `true` if the rank and file are within the range of ranks and files, and return `false` otherwise.

```crystal
Chess.valid_square?(1, 'A')
# => true
```

## 3. Get player's nickname

The game will have to get the player's nickname.
The nickname is the first two characters of the player's first name and the last two characters of the player's last name.
The nickname should be capitalized.

Define the `Chess.nickname` method that takes the arguments `first_name` that holds a string of the player's first name and `last_name` that holds a string of the player's last name.
The method should return the nickname of the player as an uppercased string.

```crystal
Chess.nickname("John", "Doe")
# => "JOOE"
```

## 4. Create move message

The game will have to create a message for a move to say which player moved to which square.
The message should use the player's nickname and the square they moved to.
The game must also determine if the move is valid by checking if the file and rank of the square are within the ranges of the files and ranks.

If the move is valid, the message should be: `"{nickname} moved to {square}"`
If the move is invalid, the message should be: `"{nickname} attempted to move to {square}, but that is not a valid square"`

Define the `Chess.move_message` method that takes the arguments `first_name` that holds a string of the player's first_name, `last_name` that holds a string of the player's last_name, and `square` that holds a string of the square the player moved to.
The method should return the message for the move as a string.

```crystal
Chess.move_message("John", "Doe", "A1")
# => "JOOE moved to A1"
```
