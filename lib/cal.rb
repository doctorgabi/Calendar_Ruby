require_relative "day"
require_relative "year"
require_relative "month"

if ARGV.length > 2
  # raise ArgumentError.new("Please enter only a month and/or a year.")
  print "Please enter only a month and/or a year."

elsif ARGV.length == 2
  if ARGV[0].to_i > 12
    print "cal: #{ARGV[0]} is neither a month number (1..12) nor a name"
  else
    @month = ARGV[0]

    if ARGV[1].to_i < 1800 || ARGV[1].to_i > 3000
      print "cal: year `#{ARGV[1]}' not in range 1800..3000"
    else
      @year = ARGV[1]
      @weekday = Day.new.zeller(@month, @year)
    end
  end

elsif ARGV.length == 1
  if ARGV[0].length != 4
    print "cal: year `#{ARGV[0]}' not in range 1800..3000"
  else
    @year = ARGV[0]
    @weekday = Day.new.zeller(1, @year)
  end

elsif ARGV.length == 0
  @month = Time.now.month.to_s
  @year = Time.now.year
  @weekday = Day.new.zeller(@month, @year)
end

#------------------------------------
#    Miscellaneous data for printing:
#------------------------------------

leapyear = Year.new.leap(@year)
@days = "Su Mo Tu We Th Fr Sa"
year = "#{@year}"
year = year.center(60)

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

#------------------------
#    Helper functions
#------------------------

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
    print_a_row_of_three_weeks
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
#------------------------
# Print month only
#------------------------
if @month && @year

  monthRange = Month.new.range(@month, leapyear)  #returns range of days for any month
  monthDays = *monthRange                        #expands range to an array
  index = Month.new.index(@weekday)                #returns 0-6 for unshifting spaces to the array
  monthArray = Month.new.monthArray(index, monthDays)   #returns array of month numbers with spaces before and after for printing
  arrayToPrint = monthArray[0]
  @month = @month.to_s
  month = Month.new.stringMonth(@month)          #returns the string version of the numeric month
  @date = "#{month} #{@year}"
  @date = @date.center(20)
  print "#{@date}\n#{@days}\n"

  6.times do
    print_a_month_alone(arrayToPrint)
  end
#----------------
#    Whole year
#----------------
elsif @year && !@month
  index = Month.new.index(@weekday)                   #NB @weekday is already set to Jan 1st when only year was provided

  counter = 1
  @arrayOfMonthArrays = []
  12.times do
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

  puts year + "  "
  4.times do
    print_a_row_of_three_months(monthNamesToPrint)
  end

end