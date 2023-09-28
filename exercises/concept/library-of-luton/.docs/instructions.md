# Instructions

The library of Luton is a large library with a big collection of different kinds of literature varying from books to art.
The library has a section where they study literature and add books to the computer system.

There are certain parts that aim to be automated and you are asked to help them with this.
This includes helping things from automating the inscribe process forms to helping decrypting texts.

## 1. Get first letter of title

The books in a library are supposed to be easy to find and therefore they are sorted by the first letter of the book's title.

Implement the `Library.first_letter` method that takes an argument `title` which holds the title of the book.
The method should return the first letter of the title.

```Crystal
Library.first_letter("Mystery of the Crystal Skull")
# => 'M'
```

## 2. Get authors initials

The library has a lot of books and they are all written by different authors.
Often authors are referred to by their initials and therefore the library requested a system that gives the initials of the author, by inputting the author's first name and last name.
The initials should be formatted as such: `{first_letter_of_first_name}.{first_letter_of_last_name}`

Implement the `Library.initials` method that takes two arguments `first_name` and `last_name` which hold the first name and last name of the author.
The method should return the initials of the author.

```Crystal
Library.initials("William", "Shakespeare")
# => "W.S"
```

## 3. Decrypt letter

Some literature is encrypted and the library has a lot of encrypted texts.
The library would like a new decryption system for a special kind of encryption.

The encryption works by taking the letter and replacing it with the letter preceding it in the alphabet.
For example `a` becomes `z`, `b` becomes `a`, `c` becomes `b`, and so on.

The library would like it to be able to decrypt both uppercase and lowercase letters and keep the same case as the original letter.

Implement the `Library.decrypt_character` method that takes an argument `character` which holds the letter to decrypt.
The method should return the decrypted letter.

```Crystal
Library.decrypt_character('a')
# => 'z'
```

## 4. Decrypt text

The library would also like to be able to decrypt a whole text, with the encryption, that takes the preceding letter in the alphabet.

The decrypter should only decrypt letters and leave all other characters as they are.

Implement the `Library.decrypt_text` method that takes an argument `text` which holds the text to decrypt.
The method should return the decrypted text.

```Crystal
Library.decrypt_text("Ifmmp Xpsme!")
# => "Hello World!"
```
