class TicTacToe < Board

def instructions
  
end


#
# return true if current player moves contains winning moves, 
# else return false
#
def winner?(curr_player_moves)
  WINNING_MOVES.each { |winning_moves| return true if winning_moves 
    & curr_player_moves == winning_moves }
  return false
end


#
# return array of available moves, receive p1 and p2 moves
#
def open_squares(p1_moves, p2_moves)
  list = []
  combined_moves = p1_moves + p2_moves
  SQUARES.each { |n| list << n if !combined_moves.include?(n)}
  return list
end


#
# return true if game is draw (no remaining winning moves
# available), else return false. Improve by taking into 
# account whose turn it is.
# 
def draw?(p1_moves, p2_moves)
  p1_moves_copy = p1_moves.dup
  p2_moves_copy = p2_moves.dup

  avail_moves = open_squares(p1_moves_copy, p2_moves_copy)

  avail_moves.each do |n| 
    p1_moves_copy << n
    p2_moves_copy << n
  end

  return true if winner?(p1_moves_copy) == false 
    && winner?(p2_moves_copy) == false
  return false
end


#
# records move for player, sets mark value
# on game baord for display purposes
#
def turn(curr_player, move)
  curr_player.move(move)                                            # calls move fcn from class Player, records move
  self.squares[move] = curr_player.mark                             # calls squares set fcn from class Board, records mark for current aquare (move), used for display purposes
end

private
  WINNING_MOVES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],         # Complete list of winning move combinations
    [2,5,8],[0,4,8],[2,4,6]]
  SQUARES = [0,1,2,3,4,5,6,7,8]                                     # Availble moves list for empty game baord                                            

end