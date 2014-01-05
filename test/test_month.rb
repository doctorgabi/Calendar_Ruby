require "minitest/autorun"
require 'month'

class MonthTest < MiniTest::Unit::TestCase

  def test_01_month_has_a_range_method
    range = Month.new.range("January", false)
  end

  def test_02_January_range_returns_0_to_31
    range = Month.new.range("01", false)
    assert_equal(1..31, range)
  end

  def test_03_February_non_leapyear_range_returns_0_to_28
    range = Month.new.range("02", false)
    assert_equal(1..28, range)
  end

  def test_04_February_leapyear_range_returns_0_to_29
    range = Month.new.range("02", true)
    assert_equal(1..29, range)
  end

  def test_04_September_non_leapyear_range_returns_0_to_30
    range = Month.new.range("09", false)
    assert_equal(1..30, range)
  end

  def test_05_July_non_leapyear_range_returns_0_to_31
    range = Month.new.range("7", false)
    assert_equal(1..31, range)
  end

  def test_06_September_leapyear_range_returns_0_to_30
    range = Month.new.range("09", true)
    assert_equal(1..30, range)
  end

  def test_07_July_leapyear_range_returns_0_to_31
    range = Month.new.range("7", true)
    assert_equal(1..31, range)
  end

  def test_08_month_has_an_index_method
    range = Month.new.index("Monday")
  end

  def test_09_Sunday_returns_index_0
    index = Month.new.index("Sunday")
    assert_equal(0, index)
  end

  def test_09_Tuesday_returns_index_2
    index = Month.new.index("Tuesday")
    assert_equal(2, index)
  end

  def test_10_Friday_returns_index_5
    index = Month.new.index("Friday")
    assert_equal(5, index)
  end

  def test_11_month_has_a_stringMonth_method
    stringMonth = Month.new.stringMonth("1")
  end

  def test_12_month_1_returns_January
    stringMonth = Month.new.stringMonth("1")
    assert_equal("January", stringMonth)
  end

  def test_13_month_09_returns_September
    stringMonth = Month.new.stringMonth("09")
    assert_equal("September", stringMonth)
  end

  def test_14_month_has_a_monthArray_method
    @monthDays = *1..31
    monthArray = Month.new.monthArray(0, @monthDays)
  end

  def test_15_monthArray_method_returns_array_with_correct_spaces_pushed_and_next_months_first_weekday_as_string
    @monthDays = *1..31
    monthArray = Month.new.monthArray(0, @monthDays)
    assert_equal([[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "], "Wednesday"], monthArray)
  end
end
