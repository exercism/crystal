# Instructions

You are in process of developing the new highly appreciated game **Crystal Hunter**.
In the game you are a character that moves around and collects crystals.
The player wins by picking up all the crystals.
If the player comes in contact with a bandit, then the player will lose all their crystals and lose the game.
There is an exception to this rule: the player can have an active power-up that makes them invisible to the bandits.

Your goal is to write some rules that will be used in the game.

## 1. Define if character gets bonus points

In the game, the character will get bonus points if they touch a bandit while having a power-up.

Define the `bonus_points?` method that takes two arguments (_if the character has an active power-up_ and _if the character is touching a bandit_) and returns a boolean value that tells whether the character will get bonus points or not.
The method should return `true` only if the character has a power-up active and is touching a bandit, and `false` otherwise.

```Crystal
Rules.new.bonus_points?(false, true)
# => false
```

## 2. Define if character scores

In the game, the player gets points when picking up a crystal or a power-up.

Define the `score?` method that takes two arguments (_if the character is touching a power-up_ and _if the character is touching a crystal_) and returns a boolean value indicating if the character scored or not.
The method should return `true` if the character is touching a power-up or a crystal, and return `false` otherwise.

```crystal
Rules.new.score?(true, true)
# => true
```

## 3. Define if character loses

Define the `lose?` method that takes two arguments (_if the character has a power-up active_ and _if the character is touching a bandit_) and returns a boolean value that indicates if the character loses or not.
The method should return `true` if the character is touching a bandit and does not have a power-up active, and return `false` otherwise.

```crystal
Rules.new.lose?(false, true)
# => true
```

## 4. Define if character wins

Define the `win?` method that takes three arguments (_if the character has eaten all of the crystals_, _if the character has a power-up active_, and _if the character is touching a bandit_) and returns a boolean value indicating if the character wins or not.
The method should return `true` if the character has gathered all crystals and has not lost based on the arguments defined in part 3, and return `false` otherwise.

```crystal
Rules.new.win?(false, true, false)
# => false
```
