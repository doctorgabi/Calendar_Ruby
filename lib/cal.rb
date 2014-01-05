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


leapyear = Year.new.leap(@year)                    #returns true or false
days = "Su Mo Tu We Th Fr Sa"


#------------------------------------------------------------
#
#    If we have both month and year print only one month
#    from our array of length 42 into 6 rows of 7:
#
#------------------------------------------------------------

if @month && @year

  @monthRange = Month.new.range(@month, leapyear)  #returns range of days for any month
  @monthDays = *@monthRange                        #expands range to an array
  index = Month.new.index(@weekday)                #returns 0-6 for unshifting spaces to the array

  index.times do
    @monthDays.unshift(" ")
  end

  extraspaces = 42 - @monthDays.length
  extraspaces.times do
    @monthDays.push(" ")
  end

  @month = Month.new.stringMonth(@month)          #returns the string version of the numeric month

  @date = "#{@month} #{@year}"
  @date = @date.center(20)
  print "#{@date}\n#{days}\n"

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
#------------------------------------------------------------
#
#    If we have only year print whole year, starting with
#    @weekday which is already set to Jan first. Need to
#    check for leapyear.
#
#------------------------------------------------------------
else
  #NB @weekday is already set to Jan 1st when only year was provided
  year = "#{@year}"
  year = year.center(64)
  puts year
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

  print "#{jan}  #{feb}  #{mar}\n"
  print "#{days}  #{days}  #{days}\n"

  print "#{apr}  #{may}  #{jun}\n"
  print "#{days}  #{days}  #{days}\n"

  print "#{jul}  #{aug}  #{sep}\n"
  print "#{days}  #{days}  #{days}\n"

  print "#{oct}  #{nov}  #{dec}\n"
  print "#{days}  #{days}  #{days}\n"
end




# puts "------------------@month ----------#{@month}"
# puts "------------------@year -----------#{@year}"
# puts "------------------@monthRange ------------#{@monthRange}"
# puts "------------------leapyear -------------#{leapyear}"
# puts "------------------@weekday --------------#{@weekday}"
# puts "-------------------index-------------------#{index}"