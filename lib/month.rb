class Month

  def range(*data) #converts a month number and leapyear info to a range of number of days in a given month
    @month = data[0]
    leapyear = data[1]

    if @month == "1" || @month == "01"
      @monthRange = 1..31
    elsif @month == "2" || @month == "02"
      if leapyear
        @monthRange = 1..29
      else
        @monthRange = 1..28
      end
    elsif @month == "3" || @month == "03"
      @monthRange = 1..31
    elsif @month == "4" || @month == "04"
      @monthRange = 1..30
    elsif @month == "5" || @month == "05"
      @monthRange = 1..31
    elsif @month == "6" || @month == "06"
      @monthRange = 1..30
    elsif @month == "7" || @month == "07"
      @monthRange = 1..31
    elsif @month == "8" || @month == "08"
      @monthRange = 1..31
    elsif @month == "9" || @month == "09"
      @monthRange = 1..30
    elsif @month == "10"
      @monthRange = 1..31
    elsif @month == "11"
      @monthRange = 1..30
    elsif @month == "12"
      @monthRange = 1..31
    end
    @monthRange
  end

  def stringMonth(month) #converts a number to a month string
    if month == "1" || month == "01"
      @month = "January"
    elsif month == "2" || month == "02"
      @month = "February"
    elsif month == "3" || month == "03"
      @month = "March"
    elsif month == "4" || month == "04"
      @month = "April"
    elsif month == "5" || month == "05"
      @month = "May"
    elsif month == "6" || month == "06"
      @month = "June"
    elsif month == "7" || month == "07"
      @month = "July"
    elsif month == "8" || month == "08"
      @month = "August"
    elsif month == "9" || month == "09"
      @month = "September"
    elsif month == "10"
      @month = "October"
    elsif month == "11"
      @month = "November"
    elsif month == "12"
      @month = "December"
    end
    @month
  end

  def index(weekday) #converts a weekday string to a number
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

  def monthArray(*data) #converts the index and array of month days to same with spaces added either side for printing, plus returns the day of the week the following month starts on.
    index = data[0]
    @monthDays = data[1]

    index.times do
    @monthDays.unshift(" ")
    end

    extraspaces = 42 - @monthDays.length

    extraspaces.times do
      @monthDays.push(" ")
    end

    if extraspaces == 14 || extraspaces == 7
      nextFirstDay = "Sunday"
    elsif extraspaces == 13 || extraspaces == 6
      nextFirstDay = "Monday"
    elsif extraspaces == 12 || extraspaces == 5
      nextFirstDay = "Tuesday"
    elsif extraspaces == 11 || extraspaces == 4
      nextFirstDay = "Wednesday"
    elsif extraspaces == 10 || extraspaces == 3
      nextFirstDay = "Thursday"
    elsif extraspaces == 9 || extraspaces == 2
      nextFirstDay = "Friday"
    elsif extraspaces == 8 || extraspaces == 1
      nextFirstDay = "Saturday"
    end

    output = [@monthDays, nextFirstDay]
    output
  end

end
