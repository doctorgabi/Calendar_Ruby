require "minitest/autorun"
require "cal"

# require_relative 'helper'

class TestCalendar < MiniTest::Unit::TestCase

  # def test_01_month_day_year_output_properly
  #   assert_equal(`ruby lib/cal.rb 02 2012`, "month 02, year 2012, day Wednesday")
  # end

  # def test_02_year_only_outputs_properly
  #   assert_equal(`ruby lib/cal.rb 2012`, "year 2012, day Sunday")
  # end

  def test_03_year_only_not_with_four_digits_fails
    assert_equal(`ruby lib/cal.rb 20123`, "Please enter a four digit year.")
  end

  def test_04_month_more_than_12_fails
    assert_equal(`ruby lib/cal.rb 13 1999`, "Please enter a valid month.")
  end

  def test_05_more_than_two_arguments_fails
    assert_equal(`ruby lib/cal.rb 04 2004 11`, "Please enter only a month and/or a year.")
  end

  def test_06_no_arguments_fails
    assert_equal(`ruby lib/cal.rb`, "Please enter a month and/or a year.")
  end

  def test_07_month_and_year_but_year_not_four_digits_fails
    assert_equal(`ruby lib/cal.rb 09 03`, "Please enter a four digit year.")
  end

  def test_08_month_with_1st_on_Sunday_works
    assert_equal(`cal 01 2012`, `ruby lib/cal.rb 01 2012`)
  end


#   def test_03_cal_integration
#     assert_equal("
#    February 2012
# Su Mo Tu We Th Fr Sa
#           1  2  3  4
#  5  6  7  8  9 10 11
# 12 13 14 15 16 17 18
# 19 20 21 22 23 24 25
# 26 27 28 29         ", `ruby lib/cal.rb 2 2012`)
#   end

end