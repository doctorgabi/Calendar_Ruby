require "minitest/autorun"
require "cal"

# require_relative 'helper'

class TestCalendar < MiniTest::Unit::TestCase

  def test_month_day_year_output_properly
    shell_output = `ruby lib/cal.rb 02 2012`
    expected_output = "month 02, year 2012, day Wednesday"
    assert_equal(expected_output, shell_output)
  end

  def test_cal_integration
    assert_equal("
   February 2012
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29         ",`ruby lib/cal.rb 2 2012`)
  end

end