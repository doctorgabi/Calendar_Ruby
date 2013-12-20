require 'test/unit'
require 'month'

class MonthTest < Test::Unit::TestCase

  def test_01_month_has_a_zeller_method
    month = Month.new.zeller
  end

  def test_02_leap_year_02_2012
    month = Month.new
    day = month.zeller(2, 2012)
    assert_equal("Wednesday", day)
  end

  def test_03_starts_on_Sat_01_2012
  end

  def test_04_not_a_leap_year_02_1900
  end

  def test_05_leap_year_div_by_100_and_400
  end

  def test_06_outside_of_scope_05_3005
  end

  def test_07_no_arguments
  end

  def test_08_four_rows_month_02_2015
  end

  def test_09_six_rows_month_09_2012
  end


end