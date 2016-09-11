# I create a method "customized_plus",  it let a integer to plus another integer
# I create a methods "customized_plus_2", it translate integer to binary and build a plus process,
# transtale back to decimal when it finishs calculation.

class Integer
  def customized_plus(num)
    bucket = []
    self.times { bucket << "count" }
    num.times { bucket << "count" }
    bucket.count
  end

  def customized_plus_2(num)

    result = []

    # translate decimal to binary
    first_num = self.to_s(2).split("")
    second_num = num.to_s(2).split("")

    #find the shorter one
    shorter_one, longer_one = first_num, second_num
    (shorter_one, longer_one = second_num, first_num) if first_num.size > second_num.size

    #iterate to cauculate the answer

    shorter_one, longer_one = shorter_one.reverse, longer_one.reverse

    longer_one.each_with_index do |num, index|
      if result[-1] == "carry"
        if num == shorter_one[index] && num == "0"
          result[-1] = 1
        elsif num == shorter_one[index] && num == "1"
          result[-1] = 1
          result << "carry"
        elsif (num == "1" && shorter_one[index] == "0" ) || (num == "0" && shorter_one[index] == "1" )
          result[-1] = 0
          result << "carry"
        else
          if num == "1"
            result[-1] = 0
            result << "carry"
          else
            result[-1] = 1
          end
        end
      elsif num == shorter_one[index] && num == "0"
          result << 0
      elsif num == shorter_one[index] && num == "1"
          result << 0
          result << "carry"
      elsif ( num == "1" && shorter_one[index] == "0" ) || ( num == "0" && shorter_one[index] == "1" )
          result << 1
      else
          result << num
      end
    end
    result[-1] = 1 if result[-1] = "carry"

    # translate binary to decimal
    result.join("").reverse.to_i(2)
  end
end

puts ""
puts "1 plus 2 equal to"
puts "method 1 => #{1.customized_plus(2)}"
puts "method 2 => #{1.customized_plus_2(2)}"
puts ""
puts "5 plus 10 equal to"
puts "method 1 => #{5.customized_plus(10)}"
puts "method 2 => #{5.customized_plus_2(10)}"
puts ""
puts "10 plus 101 equal to"
puts "method 1 => #{10.customized_plus(101)}"
puts "method 2 => #{10.customized_plus_2(101)}"
puts ""



