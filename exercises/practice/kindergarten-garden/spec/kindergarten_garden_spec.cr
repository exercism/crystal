require "spec"
require "../src/*"

describe "KindergartenGarden" do
  describe "partial garden" do
    it "garden with single student" do
      garden = KindergartenGarden.new("RC\nGG")
      garden.plants("Alice").should eq(["radishes", "clover", "grass", "grass"])
    end

    pending "different garden with single student" do
      garden = KindergartenGarden.new("VC\nRC")
      garden.plants("Alice").should eq(["violets", "clover", "radishes", "clover"])
    end

    pending "garden with two students" do
      garden = KindergartenGarden.new("VVCG\nVVRC")
      garden.plants("Bob").should eq(["clover", "grass", "radishes", "clover"])
    end

    pending "multiple students for the same garden with three students" do
      garden = KindergartenGarden.new("VVCCGG\nVVCCGG")
      garden.plants("Bob").should eq(["clover", "clover", "clover", "clover"])
      garden.plants("Charlie").should eq(["grass", "grass", "grass", "grass"])
    end
  end

  describe "full garden" do
    pending "for Alice, first student's garden" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Alice").should eq(["violets", "radishes", "violets", "radishes"])
    end

    pending "for Bob, second student's garden" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Bob").should eq(["clover", "grass", "clover", "clover"])
    end

    pending "for Charlie" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Charlie").should eq(["violets", "violets", "clover", "grass"])
    end

    pending "for David" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("David").should eq(["radishes", "violets", "clover", "radishes"])
    end

    pending "for Eve" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Eve").should eq(["clover", "grass", "radishes", "grass"])
    end

    pending "for Fred" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Fred").should eq(["grass", "clover", "violets", "clover"])
    end

    pending "for Ginny" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Ginny").should eq(["clover", "grass", "grass", "clover"])
    end

    pending "for Harriet" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Harriet").should eq(["violets", "radishes", "radishes", "violets"])
    end

    pending "for Ileana" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Ileana").should eq(["grass", "clover", "violets", "clover"])
    end

    pending "for Joseph" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Joseph").should eq(["violets", "clover", "violets", "grass"])
    end

    pending "for Kincaid, second to last student's garden" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Kincaid").should eq(["grass", "clover", "clover", "grass"])
    end

    pending "for Larry, last student's garden" do
      garden = KindergartenGarden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
      garden.plants("Larry").should eq(["grass", "violets", "clover", "violets"])
    end
  end
end
