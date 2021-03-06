class Month
  def get_month_and_year_data(input)
    if input.length > 2
      # raise ArgumentError.new("Please enter only a month and/or a year.")
      print "Please enter only a month and/or a year."

    elsif input.length == 2
      if input[0].to_i > 12
        print "cal: #{input[0]} is neither a month number (1..12) nor a name"
      else
        @month = input[0]

        if input[1].to_i < 1800 || input[1].to_i > 3000
          print "cal: year `#{input[1]}' not in range 1800..3000"
        else
          @year = input[1]
          @weekday = Day.new.zeller(@month, @year)
        end
      end

    elsif input.length == 1
      if input[0].length != 4
        print "cal: year `#{input[0]}' not in range 1800..3000"
      else
        @year = input[0]
        @weekday = Day.new.zeller(1, @year)
      end

    elsif input.length == 0
      @month = Time.now.month.to_s
      @year = Time.now.year
      @weekday = Day.new.zeller(@month, @year)
    end
  end

  def range(*data) #converts a month number and leapyear info to a range of number of days in a given month
    @month = data[0]
    leapyear = data[1]
    if ["1","01","3","03","5","05","7","07","8","08","10","12"].include? @month
      @monthRange = 1..31
    elsif ["4","04","6","06","9","09","11"].include? @month
      @monthRange = 1..30
    elsif ["2", "02"].include? @month
      if leapyear
        @monthRange = 1..29
      else
        @monthRange = 1..28
      end
    end
    @monthRange
  end

  def stringMonth(month)
    @month = "January" if month == "1" || month == "01"
    @month = "February" if month == "2" || month == "02"
    @month = "March" if month == "3" || month == "03"
    @month = "April" if month == "4" || month == "04"
    @month = "May" if month == "5" || month == "05"
    @month = "June" if month == "6" || month == "06"
    @month = "July" if month == "7" || month == "07"
    @month = "August" if month == "8" || month == "08"
    @month = "September" if month == "9" || month == "09"
    @month = "October" if month == "10"
    @month = "November" if month == "11"
    @month = "December" if month == "12"
    @month
  end

  def index(weekday)
    index = 0 if weekday == "Sunday"
    index = 1 if weekday == "Monday"
    index = 2 if weekday == "Tuesday"
    index = 3 if weekday == "Wednesday"
    index = 4 if weekday == "Thursday"
    index = 5 if weekday == "Friday"
    index = 6 if weekday == "Saturday"
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

    nextFirstDay = "Sunday" if extraspaces == 14 || extraspaces == 7
    nextFirstDay = "Monday" if extraspaces == 13 || extraspaces == 6
    nextFirstDay = "Tuesday" if extraspaces == 12 || extraspaces == 5
    nextFirstDay = "Wednesday" if extraspaces == 11 || extraspaces == 4
    nextFirstDay = "Thursday" if extraspaces == 10 || extraspaces == 3
    nextFirstDay = "Friday" if extraspaces == 9 || extraspaces == 2
    nextFirstDay = "Saturday"if extraspaces == 8 || extraspaces == 1

    output = [@monthDays, nextFirstDay]
    output
  end

  def get_month_names_to_print
    monthNamesToPrint = []
    monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    monthNamesCentered = []
    monthNames.each { |month| monthNamesCentered << month.center(20) }
    4.times do
      threeMonthNames = ""
      3.times do
        threeMonthNames << monthNamesCentered[0]
        monthNamesCentered.shift
      end
      monthNamesToPrint << threeMonthNames
    end
    monthNamesToPrint
  end

  def print_a_day(arrayToPrint)
    if arrayToPrint[0].to_i < 10
      print " #{arrayToPrint[0]} "
    else
      print "#{arrayToPrint[0]} "
    end
    arrayToPrint.shift
  end

  def print_a_week(arrayToPrint)
    7.times do
      Month.new.print_a_day(arrayToPrint)
      @counter += 1
    end
  end

  def print_a_row_of_three_weeks
    i = 0
    @counter = 1
    3.times do
      Month.new.print_a_week(@arrayOfMonthArrays[i])
      print " " if @counter == 8 || @counter == 15
      print "\n" if @counter == 22
      i += 1
    end
  end

  def print_a_row_of_three_months(monthNamesToPrint)
    print "#{monthNamesToPrint[0]}\n"
    print "#{@days}  #{@days}  #{@days}\n"
    6.times do
      Month.new.print_a_row_of_three_weeks
    end
    print " \n"
    3.times do
      @arrayOfMonthArrays.shift
    end
    monthNamesToPrint.shift
  end

  def print_a_month_alone(arrayToPrint)
    7.times do
      Month.new.print_a_day(arrayToPrint)
    end
    print "\n"
  end

  def generate_data_to_print_a_month
    monthRange = Month.new.range(@month, leapyear)
    monthDays = *monthRange
    index = Month.new.index(@weekday)                     #returns 0-6 for unshifting spaces to the array
    monthArray = Month.new.monthArray(index, monthDays)   #returns array of month numbers with spaces before and after for printing
    arrayToPrint = monthArray[0]
    @month = @month.to_s
    month = Month.new.stringMonth(@month)
    @date = "#{month} #{@year}"
    @date = @date.center(20)
  end

  def generate_a_month_array_to_print
    @month = counter.to_s
    monthRange = Month.new.range(@month, leapyear)
    monthDays = *monthRange
    index = Month.new.index(@weekday)
    monthArray = Month.new.monthArray(index, monthDays)   #array with spaces and the nextfirstday generated
    monthDays = monthArray[0]
    @weekday = monthArray[1]                              #@weekday reset ready for the next month
    @arrayOfMonthArrays.push(monthDays)
    counter += 1
  end

end
