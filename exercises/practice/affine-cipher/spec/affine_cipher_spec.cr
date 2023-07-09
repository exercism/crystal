require "spec"
require "../src/*"

describe "AffineCipher" do
  describe "encode" do
    it "encode yes" do
      AffineCipher.encode(5, 5, "yes")
        .should eq("xbt")
    end

    pending "encode no" do
      AffineCipher.encode(15, 15, "no")
        .should eq("fu")
    end

    pending "encode OMG" do
      AffineCipher.encode(21, 21, "OMG")
        .should eq("lvz")
    end

    pending "encode O M G" do
      AffineCipher.encode(25, 25, "O M G")
        .should eq("hjp")
    end

    pending "encode mindblowingly" do
      AffineCipher.encode(11, 11, "mindblowingly")
        .should eq("rzcwa gnxzc dgt")
    end

    pending "encode numbers" do
      AffineCipher.encode(3, 3, "Testing,1 2 3, testing.")
        .should eq("jqgjc rw123 jqgjc rw")
    end

    pending "encode deep thought" do
      AffineCipher.encode(5, 5, "Truth is fiction.")
        .should eq("iynia fdqfb ifje")
    end

    pending "encode all the letters" do
      AffineCipher.encode(17, 17, "The quick brown fox jumps over the lazy dog.")
        .should eq("swxtj npvyk lruol iejdc blaxk swxmh qzglf")
    end

    pending "encode with a not coprime to m" do
      expect_raises(ArgumentError) do
        AffineCipher.encode(6, 6, "This is a test.")
      end
    end
  end

  describe "decode" do
    pending "decode exercism" do
      AffineCipher.decode(3, 3, "tytgn fjr")
        .should eq("exercism")
    end

    pending "decode a sentence" do
      AffineCipher.decode(19, 19, "qdwju nqcro muwhn odqun oppmd aunwd o")
        .should eq("anobstacleisoftenasteppingstone")
    end

    pending "decode numbers" do
      AffineCipher.decode(25, 25, "odpoz ub123 odpoz ub")
        .should eq("testing123testing")
    end

    pending "decode all the letters" do
      AffineCipher.decode(17, 17, "swxtj npvyk lruol iejdc blaxk swxmh qzglf")
        .should eq("thequickbrownfoxjumpsoverthelazydog")
    end

    pending "decode with no spaces in input" do
      AffineCipher.decode(17, 17, "swxtjnpvyklruoliejdcblaxkswxmhqzglf")
        .should eq("thequickbrownfoxjumpsoverthelazydog")
    end

    pending "decode with too many spaces" do
      AffineCipher.decode(15, 15, "vszzm    cly   yd cg    qdp")
        .should eq("jollygreengiant")
    end

    pending "decode with a not coprime to m" do
      expect_raises(ArgumentError) do
        AffineCipher.decode(13, 13, "Test")
      end
    end
  end
end
