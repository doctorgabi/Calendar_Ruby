require "minitest/autorun"
require "cal"

class TestCalendar < MiniTest::Unit::TestCase
#-------------first two tests were only valid during setup - to make sure initial output was as expected.---------#
  # def test_01_month_day_year_output_properly
  #   assert_equal(`ruby lib/cal.rb 02 2012`, "month 02, year 2012, day Wednesday")
  # end

  # def test_02_year_only_outputs_properly
  #   assert_equal(`ruby lib/cal.rb 2012`, "year 2012, day Sunday")
  # end
#-----------------------------------------------------------------------------------------------------------------#
  def test_03_year_only_not_with_four_digits_fails
    assert_equal(`ruby lib/cal.rb 20123`, "cal: year `20123' not in range 1800..3000")
  end

  def test_04_month_more_than_12_fails
    assert_equal(`ruby lib/cal.rb 13 1999`, "cal: 13 is neither a month number (1..12) nor a name")
  end

  def test_05_more_than_two_arguments_fails
    assert_equal(`ruby lib/cal.rb 04 2004 11`, "Please enter only a month and/or a year.")
  end

  def test_06_month_and_year_but_year_not_four_digits_fails
    assert_equal(`ruby lib/cal.rb 09 03`, "cal: year `03' not in range 1800..3000")
  end

  def test_07_no_arguments_returns_the_current_month_and_year ##`cal` is outputting wierdly, adding "\b \b"
    assert_equal(`cal`,`ruby cal.rb`)
  end

  # -----------------------------------------------------------------------------------------
  #            Integration tests: All appear to output perfectly yet fail.
  # -----------------------------------------------------------------------------------------

  def test_08_cal_integration_month_with_1st_on_Sunday_works
    assert_equal(`cal 01 2012`, `ruby cal.rb 01 2012`)
  end

  def test_09_cal_integration_month_with_1st_on_Monday_works
    assert_equal(`cal 08 2011`, `ruby cal.rb 08 2011`)
  end

  def test_10_cal_integration_month_with_1st_on_Tuesday_works
    assert_equal(`cal 3 2011`, `ruby cal.rb 3 2011`)
  end

  def test_11_cal_integration_month_with_1st_on_Wednesday_works
    assert_equal(`cal 4 2009`, `ruby cal.rb 4 2009`)
  end

  def test_12_cal_integration_month_with_1st_on_Thursday_works
    assert_equal(`cal 1 2009`, `ruby cal.rb 1 2009`)
  end

  def test_13_cal_integration_month_with_1st_on_Friday_works
    assert_equal(`cal 5 2009`, `ruby cal.rb 5 2009`)
  end

  def test_14_cal_integration_month_with_1st_on_Saturday_works
    assert_equal(`cal 12 2007`, `ruby cal.rb 12 2007`)
  end

  def test_15_cal_integration_year_only_non_leap
    assert_equal(`cal 1983`, `ruby cal.rb 1983`)
  end

  def test_16_cal_integration
    assert_equal(`cal 02 2012`, `ruby cal.rb 2 2012`)
  end

  def test_16_cal_integration_weird_non_leap_year
    assert_equal(`cal 1900`, `ruby cal.rb 1900`)
  end

  def test_17_cal_integration_normal_non_leap_year
    assert_equal(`cal 1999`, `ruby cal.rb 1999`)
  end

  def test_18_cal_integration_normal_leap_year_divisible_by_400
    assert_equal(`cal 2000`, `ruby cal.rb 2000`)
  end

  def test_19_cal_integration_normal_leapyear_after_weird_non_leap_year
    assert_equal(`cal 1904`, `ruby cal.rb 1904`)
  end

end