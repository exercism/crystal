# Instructions

In the card game of Spellbound Steel, you have a deck of cards with either different characters such as warriors, mages, and rogues, or different spells such as fireball, ice storm, and lightning bolt.
There are two to four players in the game, and the goal is to defeat the other players by playing cards with higher power levels.

You want to get the overhand in the game by creating various methods to calculate, sort, and compare the power levels of the cards.

## 1. Find card in the deck

You are not sure if a card is in the deck or not.
Therefore you want a method to tell you were you can find the first card in the deck of the kind you are looking for.
Or if the card is not in the deck, you want to know that as well.

Implement a method `SpellboundSteel.find_card?` that takes an `Array` of `String` cards and a `String` card to find.
The method should return the index of the first card in the deck that matches the card to find.
If the card is not in the deck, the method should return `nil`.

```crystal
cards = ["Warrior", "Mage", "Rogue", "Fireball", "Ice Storm", "Lightning Bolt", "Mage"]
SpellboundSteel.find_card?(cards, "Mage")
# => 1
```

## 2. Make all characters capitalized

To make the cards easier to read, you want to capitalize all characters in the card names.
This is so you can easily see the card names when you play the cards.

Implement a method `SpellboundSteel.capitalize_cards` that takes an `Array` of `String` cards and returns the cards with all characters capitalized.

```crystal
cards = ["warrior", "mage", "rogue", "fireball", "ice storm", "lightning bolt"]
SpellboundSteel.capitalize_cards(cards)
# => ["Warrior", "Mage", "Rogue", "Fireball", "Ice Storm", "Lightning Bolt"]
```

## 3. Calculate the power level of all cards

In the game is it important to calculate the power level of all cards.
The power for all cards can been seen in the following table:

| Card Type | Power Level |
| --------- | ----------- |
| Warrior   | 10          |
| Mage      | 20          |
| Rogue     | 30          |
| Fireball  | 15          |
| Ice Storm | 25          |
| Lightning Bolt | 35    |

Implement a method `SpellboundSteel.calculate_power_level` that takes an `Array` of `String` cards and returns the total power level of all cards.

```crystal
cards = ["Warrior", "Mage", "Rogue", "Fireball", "Ice Storm", "Lightning Bolt"]
SpellboundSteel.calculate_power_level(cards)
# => 135
```

## 4. Decode a card

In the game, there are what is known as cursed cards.
These cards is a hidden card that can only be decoded by the player who played it.
To decode the card you need to take every second character in the card name and reverse it.
That will give the name of the card.

Implement a method `SpellboundSteel.decode_card` that takes a `String` card and returns the decoded card.

```crystal
SpellboundSteel.decode_card("Wraoir")
# => "Warrior"
```
