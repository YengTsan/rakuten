# I add a method to Array, it can insert an interval(array) by the rule

class Array
  def insert_an_interval(input)
    result = []
    merged_interval = []

    self.each_with_index do |interval, index|

      if interval.is_not_overlaped?(input)
        # next line will add interval which is smaller or bigger than input
        result << interval
        # next 7 lines will add input to the right place if input is not overlaped with anyother interval
        if input[0] > interval[1] && self[index+1] && input[1] < self[index+1][0]
          result << input
        elsif input[0] > interval[1] && index == (self.size - 1)
          result << input
        elsif input[1] < interval[0] && index == 0
          result.insert(0, input)
        end

      else
        # next line means the interval is overlaped both side
        if interval.is_overlaped_leftside?(input) && self[index+1] && input[1] > self[index+1][0]
          merged_interval[0] = interval[0]
          self.each do |interval|
            if interval.is_overlaped_rightside?(input)
              merged_interval[1] = interval[1]
              result << merged_interval
            end
          end

        elsif interval.is_overlaped_leftside?(input)
          merged_interval[0] = interval[0]
          merged_interval[1] = input[1]
          result << merged_interval

        elsif interval.is_overlaped_rightside?(input) && merged_interval.empty?
          merged_interval[0] = input[0]
          merged_interval[1] = interval[1]
          result << merged_interval
        end

      end
    end

    result
  end

  def is_not_overlaped?(input)
    input[1] < self[0] || input[0] > self[1]
  end

  def is_overlaped_leftside?(input)
    input[0] < self[1] && input[0] > self[0]
  end

  def is_overlaped_rightside?(input)
    input[1] > self[0] && input[1] < self[1]
  end

end

first_set_of_intervals = [[1, 3],[6, 9]]
second_set_of_intervals = [[1, 2],[3, 5], [6, 7], [8, 10], [12, 16]]

puts ""
puts "The first set of intervals is  [[1, 3],[6, 9]], and insert [2, 5] into it"
p first_set_of_intervals.insert_an_interval([2, 5])
puts ""
puts "The first set of intervals is  [[1, 2],[3, 5], [6, 7], [8, 10], [12, 16]], and insert [4, 9] into it"
p second_set_of_intervals.insert_an_interval([4, 9])
puts ""
