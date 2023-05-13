require "spec"
require "../src/*"

describe "RailFenceCipher" do
  describe "encode" do
    it "encode with two rails" do
      RailFenceCipher.encode(2, "XOXOXOXOXOXOXOXOXO")
        .should eq "XXXXXXXXXOOOOOOOOO"
    end

    pending "encode with three rails" do
      RailFenceCipher.encode(3, "WEAREDISCOVEREDFLEEATONCE")
        .should eq "WECRLTEERDSOEEFEAOCAIVDEN"
    end

    pending "encode with ending in the middle" do
      RailFenceCipher.encode(4, "EXERCISES")
        .should eq "ESXIEECSR"
    end
  end

  describe "decode" do
    pending "decode with three rails" do
      RailFenceCipher.decode(3, "TEITELHDVLSNHDTISEIIEA")
        .should eq "THEDEVILISINTHEDETAILS"
    end

    pending "decode with five rails" do
      RailFenceCipher.decode(5, "EIEXMSMESAORIWSCE")
        .should eq "EXERCISMISAWESOME"
    end

    pending "decode with six rails" do
      RailFenceCipher.decode(6, "133714114238148966225439541018335470986172518171757571896261")
        .should eq "112358132134558914423337761098715972584418167651094617711286"
    end
  end
end
