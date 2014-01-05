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
  print "Please enter only a month and/or a year."

elsif ARGV[0] == nil                               #error 2 no arguments
  print "Please enter a month and/or a year."

elsif ARGV.length == 1

  if ARGV[0].length != 4                           #error 3 year not 4 digits
    print "Please enter a four digit year."
  else
    @year = ARGV[0]
    @weekday = Day.new.zeller(1, @year)
     end

elsif ARGV.length == 2

  if ARGV[0].to_i > 12                            #error 4 month more than 2 digits
    print "Please enter a valid month."
  else
    @month = ARGV[0]

    if ARGV[1].length != 4                        #error 5 year not 4 digits
      print "Please enter a four digit year."
    else
      @year = ARGV[1]
      @weekday = Day.new.zeller(@month, @year)
    end
  end

end

#------------------------------------------------------------
#
#    Miscellaneous data for printing:
#
#------------------------------------------------------------

leapyear = Year.new.leap(@year)                    #returns true or false
days = "Su Mo Tu We Th Fr Sa"
year = "#{@year}"
year = year.center(64)

jan = "January"
jan = jan.center(20)
feb = "February"
feb = feb.center(20)
mar = "March"
mar = mar.center(20)

apr = "April"
apr = apr.center(20)
may = "May"
may = may.center(20)
jun = "June"
jun = jun.center(20)

jul = "July"
jul = jul.center(20)
aug = "August"
aug = aug.center(20)
sep = "September"
sep = sep.center(20)

oct = "October"
oct = oct.center(20)
nov = "November"
nov = nov.center(20)
dec = "December"
dec = dec.center(20)
#------------------------------------------------------------
#
#    If we have both month and year print only one month
#
#------------------------------------------------------------

if @month && @year

  @monthRange = Month.new.range(@month, leapyear)  #returns range of days for any month
  @monthDays = *@monthRange                        #expands range to an array
  index = Month.new.index(@weekday)                #returns 0-6 for unshifting spaces to the array
  monthArray = Month.new.monthArray(index, @monthDays)   #returns array of month numbers with spaces before and after for printing
  @monthDays = monthArray[0]
  @month = Month.new.stringMonth(@month)          #returns the string version of the numeric month

  @date = "#{@month} #{@year}"
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
#    If we have only year print whole year, starting with
#    @weekday which is already set to Jan first.
#
#------------------------------------------------------------
else

  index = Month.new.index(@weekday)

  #NB @weekday is already set to Jan 1st when only year was provided

#-------------------------------
#    first generate 12 arrays:
#-------------------------------

  counter = 1
  12.times do
    @month = counter.to_s                             #we have string month
    @monthRange = Month.new.range(@month, leapyear)   #we have a range
    @monthDays = *@monthRange                         #we have an array of the range
    index = Month.new.index(@weekday)                 #we have the index for unshifting spaces
    monthArray = Month.new.monthArray(index, @monthDays)   #we have the array with spaces and the nextfirstday
    @monthDays = monthArray[0]                        #we have the month array
    @weekday = monthArray[1]                          #we have reset @weekday ready for the next month

    JanArray = @monthDays if counter == 1
    FebArray = @monthDays if counter == 2
    MarArray = @monthDays if counter == 3
    AprArray = @monthDays if counter == 4
    MayArray = @monthDays if counter == 5
    JunArray = @monthDays if counter == 6
    JulArray = @monthDays if counter == 7
    AugArray = @monthDays if counter == 8
    SepArray = @monthDays if counter == 9
    OctArray = @monthDays if counter == 10
    NovArray = @monthDays if counter == 11
    DecArray = @monthDays if counter == 12            #we have stored and named each array
    counter += 1                                      #we have incremented the counter
  end

  print "#{JanArray}\n"
  print "#{FebArray}\n"
  print "#{MarArray}\n"
  print "#{AprArray}\n"
  print "#{MayArray}\n"
  print "#{JunArray}\n"
  print "#{JulArray}\n"
  print "#{AugArray}\n"
  print "#{SepArray}\n"
  print "#{OctArray}\n"
  print "#{NovArray}\n"
  print "#{DecArray}\n"

  # @month = Month.new.stringMonth(@month)


  # puts year
  # print "#{jan}  #{feb}  #{mar}\n"
  # print "#{days}  #{days}  #{days}\n"

  # print "#{apr}  #{may}  #{jun}\n"
  # print "#{days}  #{days}  #{days}\n"

  # print "#{jul}  #{aug}  #{sep}\n"
  # print "#{days}  #{days}  #{days}\n"

  # print "#{oct}  #{nov}  #{dec}\n"
  # print "#{days}  #{days}  #{days}\n"
end
  # puts "------------------@month ----------#{@month}"
  # puts "------------------@year -----------#{@year}"
  # puts "------------------@monthRange ------------#{@monthRange}"
  # puts "------------------leapyear -------------#{leapyear}"
  # puts "------------------@weekday --------------#{@weekday}"
  # puts "-------------------index-------------------#{index}"