#this is called an executable file, where I'll write the whole code like variable_name = gets blah blah
require "day"

month = ARGV[0]
year = ARGV[1]

weekday = Day.new
weekday.zeller(month, year) #to get the day of the week to start on.

puts "month #{month}, year #{year}, day #{weekday}"