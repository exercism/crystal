require "spec"
require "../src/*"

describe "CryptoSquare" do
  it "empty plaintext results in an empty ciphertext" do
    plaintext = ""
    ciphertext = ""
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end

  pending "normalization results in empty plaintext" do
    plaintext = "... --- ..."
    ciphertext = ""
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end

  pending "Lowercase" do
    plaintext = "A"
    ciphertext = "a"
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end

  pending "Remove spaces" do
    plaintext = "  b "
    ciphertext = "b"
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end

  pending "Remove punctuation" do
    plaintext = "@1,%!"
    ciphertext = "1"
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end

  pending "9 character plaintext results in 3 chunks of 3 characters" do
    plaintext = "This is fun!"
    ciphertext = "tsf hiu isn"
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end

  pending "8 character plaintext results in 3 chunks, the last one with a trailing space" do
    plaintext = "Chill out."
    ciphertext = "clu hlt io "
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end

  pending "54 character plaintext results in 7 chunks, the last two with trailing spaces" do
    plaintext = "If man was meant to stay on the ground, god would have given us roots."
    ciphertext = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
    CryptoSquare.ciphertext(plaintext).should eq(ciphertext)
  end
end
