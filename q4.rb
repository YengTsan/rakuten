# translate board to a hash, the key is the charactor, value is the number of the charactor
# if every number of charactors in the word is less than number in board
# the word exist in the board

class Array
  def word_exist?(word)
    board_count_hash = self.flatten.count_charactors
    word_count_hash = word.split("").count_charactors

    word_count_hash.each { |char, num| return false if board_count_hash[char] < num }
    true
  end

  # count_charactors will return a hash with number of every charactor

  def count_charactors
    count_hash = Hash.new(0)
    self.each { |charactor| count_hash[charactor] += 1 }
    count_hash
  end
end

board = [
          ['A', 'B', 'C', 'E'],
          ['S', 'F', 'C', 'S'],
          ['A', 'D', 'E', 'E']
        ]
puts ""
puts 'Does "ABCCED" exist in the grid?'
puts board.word_exist?("ABCCED")
puts ""
puts 'Does "SEE" exist in the grid?'
puts board.word_exist?("SEE")
puts ""
puts 'Does "ABCB" exist in the grid?'
puts board.word_exist?("ABCB")
puts ""