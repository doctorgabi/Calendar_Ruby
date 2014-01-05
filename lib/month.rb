class Month

  def range(*data)
    @month = data[0]
    leapyear = data[1]

    if @month == "1" || @month == "01"
      @month = "January"
      @monthRange = 1..31
    elsif @month == "2" || @month == "02"
      @month = "February"
      if leapyear
        @monthRange = 1..29
      else
        @monthRange = 1..28
      end
    elsif @month == "3" || @month == "03"
      @month = "March"
      @monthRange = 1..31
    elsif @month == "4" || @month == "04"
      @month = "April"
      @monthRange = 1..30
    elsif @month == "5" || @month == "05"
      @month = "May"
      @monthRange = 1..31
    elsif @month == "6" || @month == "06"
      @month = "June"
      @monthRange = 1..30
    elsif @month == "7" || @month == "07"
      @month = "July"
      @monthRange = 1..31
    elsif @month == "8" || @month == "08"
      @month = "August"
      @monthRange = 1..31
    elsif @month == "9" || @month == "09"
      @month = "September"
      @monthRange = 1..30
    elsif @month == "10"
      @month = "October"
      @monthRange = 1..31
    elsif @month == "11"
      @month = "November"
      @monthRange = 1..30
    elsif @month == "12"
      @month = "December"
      @monthRange = 1..31
    end
    @monthRange
  end

  def index(weekday)
    input = weekday
    index = 0
    if input == "Sunday"
      index = 0
    elsif input == "Monday"
      index = 1
    elsif input == "Tuesday"
      index = 2
    elsif input == "Wednesday"
      index = 3
    elsif input == "Thursday"
      index = 4
    elsif input == "Friday"
      index = 5
    elsif input == "Saturday"
      index = 6
    end
    index
  end

end
