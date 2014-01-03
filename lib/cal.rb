require_relative "day"
require_relative "year"


if ARGV.length > 2  #error 1 too many arguments
  print "Please enter only a month and/or a year."

elsif ARGV[0] == nil  #error 2 no arguments
  print "Please enter a month and/or a year."

elsif ARGV.length == 1

  if ARGV[0].length != 4  #error 3 year not 4 digits
    print "Please enter a four digit year."
  else
    @year = ARGV[0]
    @weekday = Day.new.zeller(1, @year)
    #************************************************************************************
    @output = "year #{@year}, day #{@weekday}"#******************************************
    #************************************************************************************
  end

elsif ARGV.length == 2

  if ARGV[0].to_i > 12  #error 4 month more than 2 digits
    print "Please enter a valid month."
  else
    @month = ARGV[0]

    if ARGV[1].length != 4  #error 5 year not 4 digits
      print "Please enter a four digit year."
    else
      @year = ARGV[1]
      @weekday = Day.new.zeller(@month, @year)
      #************************************************************************************
      @output = "month #{@month}, year #{@year}, day #{@weekday}"#*************************
      #************************************************************************************
    end
  end

end



# print @output
if @month == "1" || @month == "01"
  @month = "January"
  @monthDays = 1..31
elsif @month == "2" || @month == "02"
  @month = "February"
  if @leap
    @monthDays = 1..29
  else
    @monthDays = 1..28
  end
elsif @month == "3" || @month == "03"
  @month = "March"
  @monthDays = 1..31
elsif @month == "4" || @month == "04"
  @month = "April"
  @monthDays = 1..30
elsif @month == "5" || @month == "05"
  @month = "May"
  @monthDays = 1..31
elsif @month == "6" || @month == "06"
  @month = "June"
  @monthDays = 1..30
elsif @month == "7" || @month == "07"
  @month = "July"
  @monthDays = 1..31
elsif @month == "8" || @month == "08"
  @month = "August"
  @monthDays = 1..31
elsif @month == "9" || @month == "09"
  @month = "September"
  @monthDays = 1..30
elsif @month == "10"
  @month = "October"
  @monthDays = 1..31
elsif @month == "11"
  @month = "November"
  @monthDays = 1..30
elsif @month == "12"
  @month = "December"
  @monthDays = 1..31
end


if @month && @year
  @date = "#{@month} #{@year}"
  @date = @date.center(20)
  print "#{@date}
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

"
end

# @weekday = Day.new.zeller(@month, @year) #to get the day of the week to start on.
# This should return just one month, with the day 1 on the correct weekday.

# @leap