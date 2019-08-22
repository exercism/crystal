require "spec"
require "../src/*"

describe "AtbashCipher" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "encode yes" do
    AtbashCipher.encode("yes").should eq("bvh")
  end

  {{pending.id}} "encode no" do
    AtbashCipher.encode("no").should eq("ml")
  end

  {{pending.id}} "encode OMG" do
    AtbashCipher.encode("OMG").should eq("lnt")
  end

  {{pending.id}} "encode spaces" do
    AtbashCipher.encode("O M G").should eq("lnt")
  end

  {{pending.id}} "encode mindblowingly" do
    AtbashCipher.encode("mindblowingly").should eq("nrmwy oldrm tob")
  end

  {{pending.id}} "encode numbers" do
    AtbashCipher.encode("Testing,1 2 3, testing.").should eq("gvhgr mt123 gvhgr mt")
  end

  {{pending.id}} "encode deep thought" do
    AtbashCipher.encode("Truth is fiction.").should eq("gifgs rhurx grlm")
  end

  {{pending.id}} "encode all the letters" do
    AtbashCipher.encode("The quick brown fox jumps over the lazy dog.").should eq("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
  end

  {{pending.id}} "decode exercism" do
    AtbashCipher.decode("vcvix rhn").should eq("exercism")
  end

  {{pending.id}} "decode a sentence" do
    AtbashCipher.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v").should eq("anobstacleisoftenasteppingstone")
  end

  {{pending.id}} "decode numbers" do
    AtbashCipher.decode("gvhgr mt123 gvhgr mt").should eq("testing123testing")
  end

  {{pending.id}} "decode all the letters" do
    AtbashCipher.decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt").should eq("thequickbrownfoxjumpsoverthelazydog")
  end

  {{pending.id}} "decode with too many spaces" do
    AtbashCipher.decode("vc vix    r hn").should eq("exercism")
  end

  {{pending.id}} "decode with no spaces" do
    AtbashCipher.decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv").should eq("anobstacleisoftenasteppingstone")
  end
  {% end %}
end
