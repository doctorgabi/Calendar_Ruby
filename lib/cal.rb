require_relative "day"
require_relative "year"

#--------------------------------------------------------------
#
#      First check if month and year or just year were
#      entered, and that they are in the correct format,
#      yielding @year(num), @weekday(string) & @month(num)
#      NB @weekday is always Jan 1st if only year is provided
#
#--------------------------------------------------------------

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
    # @output = "year #{@year}, day #{@weekday}"#******************************************This line is for year only - need to print the whole calendar.
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
      # @output = "month #{@month}, year #{@year}, day #{@weekday}"#*************************This line is for month and year - need to print only the month.
      #************************************************************************************
    end
  end

end



#------------------------------------------------------------
#
#          Next convert the @month value to string
#          and add the right number of days per month
#          by checking if it's a leapyear.
#
#------------------------------------------------------------
leapyear = Year.new.leap(@year)

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

#------------------------------------------------------------
#
#    Make an array of length 42 with spaces before depending
#    on @weekday and spaces after so that all months fill 6
#    rows of 7 spaces (=42) for printing.
#
#------------------------------------------------------------

@monthDays = *@monthRange
index = 0
if @weekday == "Sunday"
  index = 0
elsif @weekday == "Monday"
  index = 1
elsif @weekday == "Tuesday"
  index = 2
elsif @weekday == "Wednesday"
  index = 3
elsif @weekday == "Thursday"
  index = 4
elsif @weekday == "Friday"
  index = 5
elsif @weekday == "Saturday"
  index = 6
end

#---------adds spaces before dates
index.times do
  @monthDays.unshift("  ")
end

#---------adds spaces after dates
extraspaces = 42 - @monthDays.length
extraspaces.times do
  @monthDays.push("  ")
end

#------------------------------------------------------------
#
#    If we have both month and year print only one month
#    from our array of length 42 into 6 rows of 7.
#
#------------------------------------------------------------
days = "Su Mo Tu We Th Fr Sa"
# singles = 1..9
if @month && @year
  @date = "#{@month} #{@year}"
  @date = @date.center(20)
  print "#{@date}
#{days}\n"
6.times do
  6.times do
    if @monthDays[0].to_i < 10
      print " #{@monthDays[0]} "
    else
      print "#{@monthDays[0]} "
    end
    @monthDays.shift
  end
  1.times do
    if @monthDays[0].to_i < 10
      print " #{@monthDays[0]}\n"
    else
      print "#{@monthDays[0]}\n"
    end
    @monthDays.shift
  end
end
# print @monthDays.to_s











#------------------------------------------------------------
#
#    If we have only year print whole year, starting with
#    @weekday which is already set to Jan first. Need to
#    check for leapyear.
#
#------------------------------------------------------------
#else

end
