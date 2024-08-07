# Hints

## General

- [Tuples][tuple] are data structures which are inmutable, have a fixed size, and can hold any data-type.
- Symbols may be used to denote finite states, as this exercise uses `:cup`, `:fluid_ounce`, `:teaspoon`, `:tablespoon`, `:milliliter` to denote the units used.

## 1. Get the numeric component from a volume-pair

- Consider indexing the tuple to return the volume-pair's numeric component.

## 2. Convert the volume-pair to milliliters

- Use control flow logic to determine which logic to apply based on the unit.
- Implement the method for all units to milliliters, including milliliters to milliliters.

## 3. Convert the milliliter volume-pair to another unit

- Use control flow logic to determine which logic to apply based on the unit.
- Implement the method for milliliters to all units, including milliliters to milliliters.

## 4. Convert from any unit to any unit

- Reuse the methods already created to perform the conversion in the `KitchenCalculator.convert` method.

[tuple]: https://crystal-lang.org/reference/syntax_and_semantics/literals/tuple.html
