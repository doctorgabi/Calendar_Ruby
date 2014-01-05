require "minitest/autorun"
require 'day'

class DayTest < MiniTest::Unit::TestCase

  def test_01_day_has_a_zeller_method
    day = Day.new.zeller
  end

  def test_02_leap_year_02_2012
    day = Day.new.zeller(2, 2012)
    assert_equal("Wednesday", day)
  end

  def test_03_starts_on_Sun_01_2012
    day = Day.new
    weekday = day.zeller(1, 2012)
    assert_equal("Sunday", weekday)
  end

  def test_04_not_a_leap_year_02_1900
    day = Day.new
    weekday = day.zeller(2, 1900)
    assert_equal("Thursday", weekday)
  end

  def test_05_leap_year_div_by_100_and_400
    day = Day.new
    weekday = day.zeller(02, 2000)
    assert_equal("Tuesday", weekday)
  end

  def test_06_outside_of_scope_05_3005
    day = Day.new
    weekday = day.zeller(04, 3005)
    assert_equal("Year outside of range 1800 - 3000", weekday)
  end

  def test_07_outside_of_scope_012_1780
    day = Day.new
    weekday = day.zeller(12, 1780)
    assert_equal("Year outside of range 1800 - 3000", weekday)
  end

  def test_08_no_arguments
    day = Day.new
    weekday = day.zeller()
    assert_equal("Please input a month and a year in numbers", weekday)
  end

  def test_09_four_rows_month_02_2015
    day = Day.new
    weekday = day.zeller(2, 2015)
    assert_equal("Sunday", weekday)
  end

  def test_10_known_fail_05_2009
    day = Day.new
    weekday = day.zeller(5, 2009)
    assert_equal("Friday", weekday)
  end

  def test_11_six_rows_month_04_2000
    day = Day.new
    weekday = day.zeller(4, 2000)
    assert_equal("Saturday", weekday)
  end

end