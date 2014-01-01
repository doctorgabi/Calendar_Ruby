require "minitest/autorun"
require "cal"

# require_relative 'helper'

class TestCalendar < MiniTest::Unit::TestCase

  def test_01_month_day_year_output_properly
    assert_equal(`ruby lib/cal.rb 02 2012`, "month 02, year 2012, day Wednesday")
  end

  def test_02_year_only_outputs_properly
    assert_equal(`ruby lib/cal.rb 2012`, "month 02, year 2012, day Wednesday")
  end

# Also, these first two are really only useful during construction
# phase and will stop working as the cal executable file grows.
  def test_03_cal_integration
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