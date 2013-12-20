
class Day

  def zeller(*values)
    if values.length == 0
      "Please input a month and a year in numbers"
    else
      m = values[0].to_i
      y = values[1].to_i
      if y > 3000 || y < 1800
        "Year outside of range 1800 - 3000"
      else
        y -= 1 if m == 1 || 2
        m += 12 if m == 1 || 2

        q = 1
        k = y % 100
        j = (y / 100).floor

        a = (( 13 * (m + 1) ) / 5).floor
        b = ( k / 4 ).floor
        c = ( j / 4 ).floor

        zellers_day_value = ( q + a + k + b + c + (5 * j)) % 7

        if zellers_day_value == 0
          @weekday = "Saturday"
        elsif zellers_day_value == 1
          @weekday = "Sunday"
        elsif zellers_day_value == 2
          @weekday = "Monday"
        elsif zellers_day_value == 3
          @weekday = "Tuesday"
        elsif zellers_day_value == 4
          @weekday = "Wednesday"
        elsif zellers_day_value == 5
          @weekday = "Thursday"
        elsif zellers_day_value == 6
          @weekday = "Friday"
        end

        @weekday
      end
    end
  end

end