require_relative "day"

@year
@month
@weekday
@output
#error 1 too many arguments
if ARGV.length > 2
  print "Please enter only a month and/or a year."
#error 2 no arguments
elsif ARGV[0] == nil
  print "Please enter a month and/or a year."

elsif ARGV.length == 1
  #error 3 year not 4 digits
  if ARGV[0].length != 4
    print "Please enter a four digit year."
  else
    @year = ARGV[0]
    @weekday = Day.new.zeller(1, @year)
    @output = "year #{@year}, day #{@weekday}"
  end

elsif ARGV.length == 2
  #error 4 month more than 2 digits
  if ARGV[0].to_i > 12
    print "Please enter a valid month."
  else
    @month = ARGV[0]
    #error 5 year not 4 digits
    if ARGV[1].length != 4
      print "Please enter a four digit year."
    else
      @year = ARGV[1]
      @weekday = Day.new.zeller(@month, @year)
      @output = "month #{@month}, year #{@year}, day #{@weekday}"
    end
  end

end


# @weekday = Day.new.zeller(@month, @year) #to get the day of the week to start on.
# This should return just one month, with the day 1 on the correct weekday.
print @output