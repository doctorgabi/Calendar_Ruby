require "minitest/autorun"
require "year"

class YearTest < MiniTest::Unit::TestCase

  def test_01_day_has_a_leap_method
    year = Year.new.leap
  end

  def test_02_non_leap_year_1900
    leapyear = Year.new.leap(1900)
    assert_equal(false, leapyear)
  end

  def test_03_2000_is_leap
    leapyear = Year.new.leap(2000)
    assert_equal(true, leapyear)
  end

  def test_04_1999_not_leap
    leapyear = Year.new.leap(1999)
    assert_equal(false, leapyear)
  end

  def test_05_1904_is_leap
    leapyear = Year.new.leap(1904)
    assert_equal(true, leapyear)
  end

end