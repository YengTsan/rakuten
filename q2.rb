# Everything is object in Ruby language, I add an method to Integer class,
# and I use the method to detect wether the Integer is a perfect square or not

class Integer
  def is_perfect_square?
    (1..self).each { |num| return true if num * num == self }
    false
  end
end

puts ""
puts "First_number is 99, is first_number a perfect square?"
puts 99.is_perfect_square?
puts ""
puts "Second_number is 100, is second_number a perfect square?"
puts 100.is_perfect_square?
puts ""
