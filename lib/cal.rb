require_relative "day"
require_relative "year"
require_relative "month"

userInput = ARGV
Month.new.get_month_and_year_data(userInput)
leapyear = Year.new.leap(@year)
@days = "Su Mo Tu We Th Fr Sa"
year = ("#{@year}").center(60)
Month.new.get_month_names_to_print


#------------------------
# Print month only
#------------------------
if @month && @year
  Month.new.generate_data_to_print_a_month
  print "#{@date}\n#{@days}\n"

  6.times do
    Month.new.print_a_month_alone(arrayToPrint)
  end
#-----------------------
#    Or print whole year
#-----------------------
elsif @year && !@month
  index = Month.new.index(@weekday)                   #NB @weekday is already set to Jan 1st when only year was provided
  counter = 1
  @arrayOfMonthArrays = []
  12.times do
    Month.new.generate_a_month_array_to_print
  end
  puts year + "  "
  4.times do
    print_a_row_of_three_months(monthNamesToPrint)
  end

end