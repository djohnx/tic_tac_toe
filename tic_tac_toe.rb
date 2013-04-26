class TicTacToe < Board

#
# Display instructions
# Display gameboard representation
#
def instructions
  puts
  puts "------ Tic Tac Toe ------"
  puts
  puts "Welcome!"
  puts "Valid input values are:"
  puts
  puts "[quit, 0, 1, 2, 3, 4, 5, 6, 7, 8]"
  puts

  puts "Gameboard square representation:"
  puts
  print "   0   |"
  print "   1   |"
  print "   2   "
  puts
  print "----------------------"
  puts
  print "   3   |"
  print "   4   |"
  print "   5   "
  puts
  print "----------------------"
  puts
  print "   6   |"
  print "   7   |"
  print "   8   "
  puts  
  puts  
  puts
end


#
# Determine is current player made winning move
# return true if this is the case 
# else return false
#
def winner?(curr_player_moves)
  WINNING_MOVES.each { |winning_moves| return true if winning_moves & curr_player_moves == winning_moves }
  return false
end


#
# Determine available moves
# receive p1 moves and p2 moves
# return array of available moves
#
def open_squares(p1_moves, p2_moves)
  avail_moves = Array.new
  SQUARES.each { |n| avail_moves << n unless p1_moves.include?(n) || p2_moves.include?(n) }
  return avail_moves
end


#
# return true if game is draw (no remaining winning moves
# available), else return false. Improve by taking into 
# account whose turn it is.
# 
def draw?(p1_moves, p2_moves)
  avail_moves = open_squares(p1_moves, p2_moves)
  return true if winner?(p1_moves | avail_moves) == false && winner?(p2_moves | avail_moves) == false
  return false
end


private
  # Complete list of winning move combinations
  WINNING_MOVES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]   

  # Availble moves list for empty game baord 
  SQUARES = [0,1,2,3,4,5,6,7,8]                                                                                
end