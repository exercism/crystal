# Hints

## 1. Find card in the deck

- There is a [built-in method][index] that can find the first element in the collection that meets the condition specified in the block, and return its index or `nil` if no element is found.

## 2. Make all characters capitalized

- There is  a [built-in method][map] to transform all elements in the collection.
- There is a [built-in method][capitalize] to capitalize a words for `String`.

## 3. Calculate the power level of all cards

- You can use the [`sum` method] to calculate the total power level of all cards.
- The `sum` method can also accept a block to transform the elements before summing them.

## 4. Decode a card

- There is a [built in method][each_with_char] to iterate over the characters of a `String` with an index.

[index]: https://crystal-lang.org/api/Enumerable.html#index%28obj%29%3AInt32%7CNil-instance-method
[sum]:https://crystal-lang.org/api/Enumerable.html#index%28obj%29%3AInt32%7CNil-instance-method
[sort_by]: https://crystal-lang.org/api/Array.html#sort_by%28%26block%3AT-%3E_%29%3AArray%28T%29-instance-method
[each_with_char]: https://crystal-lang.org/api/String.html#each_char_with_index%28offset%3D0%2C%26%29-instance-method
[map]: https://crystal-lang.org/api/Enumerable.html#map%28%26%3AT-%3EU%29%3AArray%28U%29forallU-instance-method
[capitalize]: https://crystal-lang.org/api/String.html#capitalize%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
