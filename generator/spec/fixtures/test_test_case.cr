class TestTestCase
  include Exercise::TestCase(Int32, Int32)

  def test_description
    "should do #{description}"
  end

  def test_workload
    if should_raise?
      <<-EOF
      expect_raises(ArgumentError) do
          Test.yup(#{input}).should eq(#{expected})
        end
      EOF
    else
      "Test.yup(#{input}).should eq(#{expected})"
    end
  end

  def should_raise?
    expected == 0
  end
end

