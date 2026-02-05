require "spec"
require "../src/*"

describe "BafflingBirthdays" do
  it "one birthdate" do
    birthdays = [Time.parse_utc("2000-01-01", "%Y-%m-%d")]
    BafflingBirthdays.shared_birthday(birthdays).should be_false
  end

  pending "two birthdates with same year, month, and day" do
    birthdays = [Time.parse_utc("2000-01-01", "%Y-%m-%d"), Time.parse_utc("2000-01-01", "%Y-%m-%d")]
    BafflingBirthdays.shared_birthday(birthdays).should be_true
  end

  pending "two birthdates with same year and month, but different day" do
    birthdays = [Time.parse_utc("2012-05-09", "%Y-%m-%d"), Time.parse_utc("2012-05-17", "%Y-%m-%d")]
    BafflingBirthdays.shared_birthday(birthdays).should be_false
  end

  pending "two birthdates with same month and day, but different year" do
    birthdays = [Time.parse_utc("1999-10-23", "%Y-%m-%d"), Time.parse_utc("1988-10-23", "%Y-%m-%d")]
    BafflingBirthdays.shared_birthday(birthdays).should be_true
  end

  pending "two birthdates with same year, but different month and day" do
    birthdays = [Time.parse_utc("2007-12-19", "%Y-%m-%d"), Time.parse_utc("2007-04-27", "%Y-%m-%d")]
    BafflingBirthdays.shared_birthday(birthdays).should be_false
  end

  pending "two birthdates with different year, month, and day" do
    birthdays = [Time.parse_utc("1997-08-04", "%Y-%m-%d"), Time.parse_utc("1963-11-23", "%Y-%m-%d")]
    BafflingBirthdays.shared_birthday(birthdays).should be_false
  end

  pending "multiple birthdates without shared birthday" do
    birthdays = [
      Time.parse_utc("1966-07-29", "%Y-%m-%d"), Time.parse_utc("1977-02-12", "%Y-%m-%d"), Time.parse_utc("2001-12-25", "%Y-%m-%d"),
      Time.parse_utc("1980-11-10", "%Y-%m-%d"),
    ]
    BafflingBirthdays.shared_birthday(birthdays).should be_false
  end

  pending "multiple birthdates with one shared birthday" do
    birthdays = [
      Time.parse_utc("1966-07-29", "%Y-%m-%d"), Time.parse_utc("1977-02-12", "%Y-%m-%d"), Time.parse_utc("2001-07-29", "%Y-%m-%d"),
      Time.parse_utc("1980-11-10", "%Y-%m-%d"),
    ]
    BafflingBirthdays.shared_birthday(birthdays).should be_true
  end

  pending "multiple birthdates with more than one shared birthday" do
    birthdays = [
      Time.parse_utc("1966-07-29", "%Y-%m-%d"), Time.parse_utc("1977-02-12", "%Y-%m-%d"), Time.parse_utc("2001-12-25", "%Y-%m-%d"),
      Time.parse_utc("1980-07-29", "%Y-%m-%d"), Time.parse_utc("2019-02-12", "%Y-%m-%d"),
    ]
    BafflingBirthdays.shared_birthday(birthdays).should be_true
  end

  pending "generate requested number of birthdates" do
    (1..10).each do |size|
      result = BafflingBirthdays.random_birthdates(size)
      result.size.should eq(size)
    end
  end

  pending "years are not leap years" do
    result = BafflingBirthdays.random_birthdates(50)
    result.all? { |date| Time.leap_year?(date.year) }.should be_false
  end

  pending "months are random" do
    result = BafflingBirthdays.random_birthdates(100)
    result.to_set { |date| date.month }.size.should eq(12)
  end

  pending "days are random" do
    result = BafflingBirthdays.random_birthdates(300)
    result.to_set { |date| date.day }.size.should eq(31)
  end

  pending "for one person" do
    BafflingBirthdays.estimated_probability_of_shared_birthday(1).should be_close 0.0, 0.01
  end

  pending "among ten people" do
    BafflingBirthdays.estimated_probability_of_shared_birthday(10).should be_close 11.694818, 1
  end

  pending "among twenty-three people" do
    BafflingBirthdays.estimated_probability_of_shared_birthday(23).should be_close 50.729723, 1
  end

  pending "among seventy people" do
    BafflingBirthdays.estimated_probability_of_shared_birthday(70).should be_close 99.915958, 1
  end
end
