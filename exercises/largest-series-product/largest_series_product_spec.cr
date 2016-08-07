require "spec"
require "./largest_series_product"

describe "Series" do
  describe "#largest_product" do
    it "can find the largest product of 2 with numbers in order" do
      Series.new("0123456789").largest_product(2).should eq 72
    end
    it "can find the largest product of 2" do
      Series.new("576802143").largest_product(2).should eq 48
    end
    it "finds the largest product if span equals length" do
      Series.new("29").largest_product(2).should eq 18
    end
    it "can find the largest product of 3 with numbers in order" do
      Series.new("0123456789").largest_product(3).should eq 504
    end
    it "can find the largest product of 3" do
      Series.new("1027839564").largest_product(3).should eq 270
    end
    it "can find the largest product of 5 with numbers in order" do
      Series.new("0123456789").largest_product(5).should eq 15120
    end
    it "can get the largest product of a big number" do
      Series.new("73167176531330624919225119674426574742355349194934").largest_product(6).should eq 23520
    end
    it "can get the largest product of a big number II" do
      Series.new("52677741234314237566414902593461595376319419139427").largest_product(6).should eq 28350
    end
    it "can get the largest product of a big number (Project Euler)" do
      Series.new("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450").largest_product(13).should eq 23514624000
    end
    it "reports zero if the only digits are zero" do
      Series.new("0000").largest_product(2).should eq 0
    end
    it "reports zero if all spans include zero" do
      Series.new("99099").largest_product(3).should eq 0
    end
    it "rejects span longer than string length" do
      expect_raises(ArgumentError) { Series.new("123").largest_product(4) }
    end
    it "reports 1 for empty string and empty product (0 span)" do
      Series.new("").largest_product(0).should eq 1
    end
    it "reports 1 for nonempty string and empty product (0 span)" do
      Series.new("123").largest_product(0).should eq 1
    end
    it "rejects empty string and nonzero span" do
      expect_raises(ArgumentError) { Series.new("").largest_product(1) }
    end
    it "rejects invalid character in digits" do
      expect_raises(ArgumentError) { Series.new("1234a5").largest_product(2).should eq -1 }
    end
    it "rejects negative span" do
      expect_raises(ArgumentError) { Series.new("12345").largest_product(-1) }
    end
  end
end
