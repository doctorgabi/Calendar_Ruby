require "minitest/autorun"
require "year"

class YearTest < MiniTest::Unit::TestCase

  def test_01_day_has_a_leap_method
    year = Year.new.leap
  end

  # def test_01_leap_year_2000
  #   year = Year.new.leap
  #   weekday = day.zeller(2, 2012)
  #   assert_equal("Wednesday", weekday)
  # end

  def test_02_leap_year_2000
    leapyear = Year.new.leap(1900)
    assert_equal(false, leapyear)
  end

  # def test_01_2000_is_leap
  #   assert_equal("true", `ruby lib/year.rb 01 2000`)
  # end

  # def test_02_1900_not_leap
  #   assert_equal("false", `ruby lib/year.rb 01 1900`)
  # end

  # def test_03_1904_is_leap
  #   assert_equal("true", `ruby lib/year.rb 1904`)
  # end

end