require "spec"
require "../src/*"

describe "Atbash" do
  describe "#encode" do
    it "encodes no" do
      Atbash.encode("no").should eq "ml"
    end

    pending "encodes yes" do
      Atbash.encode("yes").should eq "bvh"
    end

    pending "encode OMG" do
      Atbash.encode("OMG").should eq "lnt"
    end

    pending "encodes O M G spaces" do
      Atbash.encode("O M G").should eq "lnt"
    end

    pending "encode long words" do
      Atbash.encode("mindblowingly").should eq "nrmwy oldrm tob"
    end

    pending "encodes numbers" do
      Atbash.encode("Testing, 1 2 3, testing.").should eq "gvhgr mt123 gvhgr mt"
    end

    pending "encodes sentence" do
      Atbash.encode("Truth is fiction.").should eq "gifgs rhurx grlm"
    end

    pending "encodes all the things" do
      plaintext = "The quick brown fox jumps over the lazy dog."
      cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
      Atbash.encode(plaintext).should eq cipher
    end
  end
end
