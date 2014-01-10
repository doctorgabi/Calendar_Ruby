require_relative "day"
require_relative "year"
require_relative "month"

#--------------------------------------------------------------
#
#      First check if month and year or just year were
#      entered, and that they are in the correct format,
#      yielding @year(num), @weekday(string) & @month(num)
#      NB @weekday is always Jan 1st if only year is provided
#
#--------------------------------------------------------------


if ARGV.length > 2                                 #error 1 too many arguments
  # raise ArgumentError.new("Please enter only a month and/or a year.")
  print "Please enter only a month and/or a year."

elsif ARGV.length == 2
  if ARGV[0].to_i > 12                            #error 4 month more than 2 digits
    print "cal: #{ARGV[0]} is neither a month number (1..12) nor a name"
  else
    @month = ARGV[0]

    if ARGV[1].to_i < 1800 || ARGV[1].to_i > 3000                        #error 5 year not 4 digits
      print "cal: year `#{ARGV[1]}' not in range 1800..3000"
    else
      @year = ARGV[1]
      @weekday = Day.new.zeller(@month, @year)
    end
  end

elsif ARGV.length == 1
  if ARGV[0].length != 4                           #error 3 year not 4 digits
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

#------------------------------------------------------------
#
#    Miscellaneous data for printing:
#
#------------------------------------------------------------

leapyear = Year.new.leap(@year)                    #returns true or false
@days = "Su Mo Tu We Th Fr Sa"
year = "#{@year}"
year = year.center(60)

monthNamesToPrint = []
jan = ("January").center(20)
feb = ("February").center(20)
mar = ("March").center(20)
apr = ("April").center(20)
may = ("May").center(20)
jun = ("June").center(20)
jul = ("July").center(20)
aug = ("August").center(20)
sep = ("September").center(20)
oct = ("October").center(20)
nov = ("November").center(20)
dec = ("December").center(20)

monthNamesToPrint.push("#{jan}  #{feb}  #{mar}",
                      "#{apr}  #{may}  #{jun}",
                      "#{jul}  #{aug}  #{sep}",
                      "#{oct}  #{nov}  #{dec}")

#------------------------------------------------------------
#
#    If we have both month and year print only one month
#
#------------------------------------------------------------
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
    print_a_day(arrayToPrint)
    @counter += 1
  end
end

def print_a_row_of_three_months(arrayOfMonthArrays)
  i = 0
  @counter = 1
  3.times do
    print_a_week(arrayOfMonthArrays[i])
    print " " if @counter == 8 || @counter == 15
    print "\n" if @counter == 22
    i += 1
  end
end

if @month && @year

  @monthRange = Month.new.range(@month, leapyear)  #returns range of days for any month
  @monthDays = *@monthRange                        #expands range to an array
  index = Month.new.index(@weekday)                #returns 0-6 for unshifting spaces to the array
  monthArray = Month.new.monthArray(index, @monthDays)   #returns array of month numbers with spaces before and after for printing
  @monthDays = monthArray[0]
  @month = @month.to_s
  month = Month.new.stringMonth(@month)          #returns the string version of the numeric month
  @date = "#{month} #{@year}"
  @date = @date.center(20)
  print "#{@date}\n#{days}\n"

  6.times do                                      #for 6 rows/weeks
                                                  #(print the first value in the array then delete it)
    6.times do                                    #for the first 6 days of a week
      if @monthDays[0].to_i < 10
        print " #{@monthDays[0]} "                #if <10 prints with a space either side
      else
        print "#{@monthDays[0]} "                 #else prints only with a space to the right
      end
      @monthDays.shift
    end

    1.times do                                    #for the last day of the week need a newline
      if @monthDays[0].to_i < 10
        print " #{@monthDays[0]}\n"
      else
        print "#{@monthDays[0]}\n"
      end
      @monthDays.shift
    end

  end
#------------------------------------------------------------
#
#    If we have only year print whole year
#
#------------------------------------------------------------
elsif @year && !@month

  index = Month.new.index(@weekday)                   #NB @weekday is already set to Jan 1st when only year was provided

#-------------------------------
#    first generate 12 arrays:
#-------------------------------

  counter = 1
  arrayOfMonthArrays = []
  12.times do
    @month = counter.to_s                             #string of month number generated
    @monthRange = Month.new.range(@month, leapyear)   #range created
    @monthDays = *@monthRange                         #array of the range created
    index = Month.new.index(@weekday)                 #index for unshifting spaces generated
    monthArray = Month.new.monthArray(index, @monthDays)   #array with spaces and the nextfirstday generated
    @monthDays = monthArray[0]                        #month array aquired
    @weekday = monthArray[1]                          #@weekday reset ready for the next month
    arrayOfMonthArrays.push(@monthDays)              #12 arrays stored and named
    counter += 1
  end

  puts year + "  "
  4.times do
    print "#{monthNamesToPrint[0]}\n"
    print "#{days}  #{days}  #{days}\n"
    6.times do
      print_a_row_of_three_months(arrayOfMonthArrays)
    end
    print " \n"                                       #puts a space below each 3 months
    3.times do
      arrayOfMonthArrays.shift                       #deletes the first 3 months once they've been output.
    end

    monthNamesToPrint.shift
  end

end

