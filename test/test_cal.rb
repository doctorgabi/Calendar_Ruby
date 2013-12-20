require 'test/unit'
require "cal"
# require_relative 'helper'

class TestCalendar < Test::Unit::TestCase

  def test_month_day_year_output_properly
  #   ruby takes_arguments.rb 02 2012
  # end
  # shell_output = ruby cal.rb 02 2012
    shell_output = `ruby lib/cal.rb 02 2012`
    expected_output = "month 02, year 2012, day Wednesday"
    assert_equal(expected_output, shell_output)
  end

  # def test_cal_integration
  #   assert_equal(`cal 2 2012`, `ruby cal.rb 2 2012`)
  # end

end