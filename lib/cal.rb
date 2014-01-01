#this is called an executable file, where I'll write the whole code like variable_name = gets blah blah
require_relative "day"
#need to put in some logic. if argv[0]==nil, exit the program or raise an error
#if argv[1] == nil, then the user only put in one argument, so it must be a year.
#make sure the year is in 4 digits or puts a message. if they put a correct year,
#then argv[0] = year
#if they put two arguments, and argv[2] = nil, then argv[0] = month and argv[1] = year
#again, ensure that argv[1] is in the correct format of four digits again.
month = ARGV[0]
year = ARGV[1]
#put the next line in a conditional's output for when there are two arguments
weekday = Day.new.zeller(month, year) #to get the day of the week to start on.
# This should return just one month, with the day 1 on the correct weekday.
print "month #{month}, year #{year}, day #{weekday}"