require "spec"
require "../src/*"

describe "SwiftScheduling" do
  it "NOW translates to two hours later" do
    start = Time.parse_utc("2012-02-13T09:00:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2012-02-13T11:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "NOW").should eq(expected)
  end

  pending "ASAP before one in the afternoon translates to today at five in the afternoon" do
    start = Time.parse_utc("1999-06-03T09:45:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("1999-06-03T17:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "ASAP").should eq(expected)
  end

  pending "ASAP at one in the afternoon translates to tomorrow at one in the afternoon" do
    start = Time.parse_utc("2008-12-21T13:00:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2008-12-22T13:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "ASAP").should eq(expected)
  end

  pending "ASAP after one in the afternoon translates to tomorrow at one in the afternoon" do
    start = Time.parse_utc("2008-12-21T14:50:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2008-12-22T13:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "ASAP").should eq(expected)
  end

  pending "EOW on Monday translates to Friday at five in the afternoon" do
    start = Time.parse_utc("2025-02-03T16:00:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2025-02-07T17:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "EOW").should eq(expected)
  end

  pending "EOW on Tuesday translates to Friday at five in the afternoon" do
    start = Time.parse_utc("1997-04-29T10:50:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("1997-05-02T17:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "EOW").should eq(expected)
  end

  pending "EOW on Wednesday translates to Friday at five in the afternoon" do
    start = Time.parse_utc("2005-09-14T11:00:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2005-09-16T17:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "EOW").should eq(expected)
  end

  pending "EOW on Thursday translates to Sunday at eight in the evening" do
    start = Time.parse_utc("2011-05-19T08:30:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2011-05-22T20:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "EOW").should eq(expected)
  end

  pending "EOW on Friday translates to Sunday at eight in the evening" do
    start = Time.parse_utc("2022-08-05T14:00:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2022-08-07T20:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "EOW").should eq(expected)
  end

  pending "EOW translates to leap day" do
    start = Time.parse_utc("2008-02-25T10:30:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2008-02-29T17:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "EOW").should eq(expected)
  end

  pending "2M before the second month of this year translates to the first workday of the second month of this year" do
    start = Time.parse_utc("2007-01-02T14:15:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2007-02-01T08:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "2M").should eq(expected)
  end

  pending "11M in the eleventh month translates to the first workday of the eleventh month of next year" do
    start = Time.parse_utc("2013-11-21T15:30:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2014-11-03T08:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "11M").should eq(expected)
  end

  pending "4M in the ninth month translates to the first workday of the fourth month of next year" do
    start = Time.parse_utc("2019-11-18T15:15:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2020-04-01T08:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "4M").should eq(expected)
  end

  pending "Q1 in the first quarter translates to the last workday of the first quarter of this year" do
    start = Time.parse_utc("2003-01-01T10:45:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2003-03-31T08:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "Q1").should eq(expected)
  end

  pending "Q4 in the second quarter translates to the last workday of the fourth quarter of this year" do
    start = Time.parse_utc("2001-04-09T09:00:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2001-12-31T08:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "Q4").should eq(expected)
  end

  pending "Q3 in the fourth quarter translates to the last workday of the third quarter of next year" do
    start = Time.parse_utc("2022-10-06T11:00:00", "%Y-%m-%dT%H:%M:%S")
    expected = Time.parse_utc("2023-09-29T08:00:00", "%Y-%m-%dT%H:%M:%S")
    SwiftScheduling.delivery_date(start, "Q3").should eq(expected)
  end
end
