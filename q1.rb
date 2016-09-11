# I use two way to reverse the_string, one is ruby library,
# the other is to build a class and add a method to reverse the string.

class Custimized_function
  def self.reverse(string)
    array_of_the_string = string.split("")
    the_reversed_string = ""
    (string.length - 1).downto(0).each { |num| the_reversed_string << array_of_the_string[num] }
    the_reversed_string
  end
end

the_string = "netukar_evol_I"

puts ""
puts "The original string is [#{the_string}]"
puts ""
puts "I use ruby library to reverse the string => [#{the_string.reverse}] "
puts "I build a class to reverse the string => [#{Custimized_function.reverse(the_string)}] "
puts ""