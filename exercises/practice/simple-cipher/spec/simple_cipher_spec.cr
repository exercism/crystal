require "spec"
require "../src/*"

describe "SimpleCipher" do
  describe "Random key cipher" do
    it "can encode" do
      cipher = SimpleCipher.new
      cipher.encode("aaaaaaaaaa").should eq(cipher.key[0, 10])
    end

    it "can decode" do
      cipher = SimpleCipher.new
      cipher.decode(cipher.key[0, 10]).should eq("aaaaaaaaaa")
    end

    it "is reversible" do
      cipher = SimpleCipher.new
      cipher.decode(cipher.encode("abcdefghij")).should eq("abcdefghij")
    end

    it "key is made only of lowercase letters" do
      cipher = SimpleCipher.new
      /^[a-z]+$/.matches?(cipher.key).should be_true
    end
  end

  describe "Substituion cipher" do
    it "can encode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.encode("aaaaaaaaaa").should eq("abcdefghij")
    end

    it "can decode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.decode("abcdefghij").should eq("aaaaaaaaaa")
    end

    it "is reversible" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.decode(cipher.encode("abcdefghij")).should eq("abcdefghij")
    end

    it "can double shift encode" do
      cipher = SimpleCipher.new("iamapandabear")
      cipher.encode("iamapandabear").should eq("qayaeaagaciai")
    end

    it "can wrap on encode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.encode("zzzzzzzzzz").should eq("zabcdefghi")
    end

    it "can wrap on decode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.decode("zabcdefghi").should eq("zzzzzzzzzz")
    end

    it "can encode messages longer than the key" do
      cipher = SimpleCipher.new("abc")
      cipher.encode("iamapandabear").should eq("iboaqcnecbfcr")
    end

    it "can decode messages longer than the key" do
      cipher = SimpleCipher.new("abc")
      cipher.decode("iboaqcnecbfcr").should eq("iamapandabear")
    end
  end
end
