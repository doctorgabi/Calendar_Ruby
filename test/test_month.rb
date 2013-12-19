require 'test/unit'
require 'month'

class MonthTest < Test::Unit::TestCase

  def test_01_month_has_a_zeller_method
    month = Month.new.zeller
  end


end