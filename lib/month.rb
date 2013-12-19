#this is a regular class file, where the code will go
class Month

  def zeller(*values)

    q = 1
    m = 3
    y = 1904
    K = y % 100
    J = (y / 100).floor

    a = (( 13 * (m + 1) ) / 5).floor
    b = ( K / 4 ).floor
    c = ( J / 4 ).floor

    zellers_day_value = ( q + a + K + b + c + (5 * J)) % 7

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
    puts @weekday

  end

end