class TestDSLTestCase
  include TestDSL
  include Exercise::TestCase(Int32, Int32)

  _it "should do #{description}" do
    "Test.yup(#{input}).should eq(#{expected})"
  end

  _expect_raises(ArgumentError) do
    "Test.yup(#{input})"
  end

  def should_raise?
    expected == 0
  end
end

