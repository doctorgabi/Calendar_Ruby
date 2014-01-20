class Month
  # def get_month_and_year_data(input)
  #   if input.length > 2
  #     print "Please enter only a month and/or a year."

  #   elsif input.length == 2
  #     if input[0].to_i > 12
  #       print "cal: #{input[0]} is neither a month number (1..12) nor a name"
  #     else
  #       @month = input[0]

  #       if input[1].to_i < 1800 || input[1].to_i > 3000
  #         print "cal: year `#{input[1]}' not in range 1800..3000"
  #       else
  #         @year = input[1]
  #         @weekday = Day.new.zeller(@month, @year)
  #       end
  #     end

  #   elsif input.length == 1
  #     if input[0].length != 4
  #       print "cal: year `#{input[0]}' not in range 1800..3000"
  #     else
  #       @year = input[0]
  #       @weekday = Day.new.zeller(1, @year)
  #     end

  #   elsif input.length == 0
  #     @month = Time.now.month.to_s
  #     @year = Time.now.year
  #     @weekday = Day.new.zeller(@month, @year)
  #   end
  # end

  def range(*data) #converts a month number and leapyear info to a range of number of days in a given month
    @month = data[0].to_i
    leapyear = data[1]
    if [1,3,5,7,8,10,12].include? @month
      @monthRange = 1..31
    elsif [4,6,9,11].include? @month
      @monthRange = 1..30
    else
      if @month == 2 && leapyear
        @monthRange = 1..29
      else
        @monthRange = 1..28
      end
    end
    # case @month
    # when 1 || 3 || 5 || 7 || 8 || 10 || 12
    #   @monthRange = 1..31
    # when 4 || 6 || 9 || 11
    #   @monthRange = 1..30
    # when 2
    #   if leapyear
    #     @monthRange = 1..29
    #   else
    #     @monthRange = 1..28
    #   end
    # end
    @monthRange
  end

  def stringMonth(month) #converts a number to a month string
    @month = month.to_i
    case @month
    when 1
      "January"
    when 2
      "February"
    when 3
      "March"
    when 4
      "April"
    when 5
      "May"
    when 6
      "June"
    when 7
      "July"
    when 8
      "August"
    when 9
      "September"
    when 10
      "October"
    when 11
      "November"
    when 12
      "December"
    end
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

  # def get_month_names_to_print
  #   monthNamesToPrint = []
  #   monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  #   monthNamesCentered = []
  #   monthNames.each { |month| monthNamesCentered << month.center(20) }
  #   4.times do
  #     threeMonthNames = ""
  #     3.times do
  #       threeMonthNames << monthNamesCentered[0]
  #       monthNamesCentered.shift
  #     end
  #     monthNamesToPrint << threeMonthNames
  #   end
  #   monthNamesToPrint
  # end

  def print_a_day(arrayToPrint)
    if arrayToPrint[0].to_i < 10
      print " #{arrayToPrint[0]} "
    else
      print "#{arrayToPrint[0]} "
    end
    arrayToPrint.shift
  end

  # def print_a_week(arrayToPrint)
  #   7.times do
  #     Month.new.print_a_day(arrayToPrint)
  #     @counter += 1
  #   end
  # end

  # def print_a_row_of_three_weeks
  #   i = 0
  #   @counter = 1
  #   3.times do
  #     Month.new.print_a_week(@arrayOfMonthArrays[i])
  #     print " " if @counter == 8 || @counter == 15
  #     print "\n" if @counter == 22
  #     i += 1
  #   end
  # end

  # def print_a_row_of_three_months(monthNamesToPrint)
  #   print "#{monthNamesToPrint[0]}\n"
  #   print "#{@days}  #{@days}  #{@days}\n"
  #   6.times do
  #     Month.new.print_a_row_of_three_weeks
  #   end
  #   print " \n"
  #   3.times do
  #     @arrayOfMonthArrays.shift
  #   end
  #   monthNamesToPrint.shift
  # end

  # def print_a_month_alone(arrayToPrint)
  #   7.times do
  #     Month.new.print_a_day(arrayToPrint)
  #   end
  #   print "\n"
  # end
end
