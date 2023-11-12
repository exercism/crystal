# Instructions

Your has just sent you a message with an important secret.
Not wanting to make it easy for others to read it, the message has been encrypted using a series of bit manipulations.
You will need to write a program to help decrypt the message.

## 1. Shift back the bits

The first step in decrypting the message is to undo the shifting from the encryption process by shifting the bits back to the left.
The number of places to shift can vary between messages.

Implement the method `Secrets.shift_back` that takes a value and the number of places to shift left.

```crystal
Secrets.shift_back(0b0001, 2)
# => 0b0100
```

## 2. Apply a bit mask

The next step is apply a bit mask to extract the value of certain bits.
The mask is applied by performing a bitwise AND between the value and the mask.

Implement the method `Secrets.apply_mask` that takes a value and applies a mask.

```crystal
Secrets.apply_mask(0b0110, 0b0101)
# => 0b0100
```

## 3. Set some bits

Shifting bits to the left has added some new 0 bits.
Some of these new bits need to be set to 1.
The bitwise OR is useful for setting certain bits to 1 while preserving the rest.

Implement the method `Secrets.set_bits` that takes two values and performs a bitwise OR.

```crystal
Secrets.set_bits(0b0110, 0b0101)
# => 0b111
```

## 4. Reverse XOR

Part of the encryption process applies a XOR with an agreed value.
To get back to the original value, the encrypted value can simply be XOR again with the agreed value.
However, due to a misunderstanding, your friend flipped the agreed value's bits (i.e. applied a bitwise NOT to the agreed value) before applying the XOR. 

Implement the `Secrets.reverse_xor` method that takes the encrypted and agreed values and calculates the original value.

```crystal
Secrets.reverse_xor(0b1100, 0b0101)
# => 0b(0110)
```