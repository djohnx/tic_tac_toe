require_relative 'player'
require_relative 'board'
require_relative 'tic_tac_toe'
require_relative 'minimax'


#
# checks and accepts player input value
#
def valid_move(curr_player, avail_moves)
  input = ""

  loop do 
    print "#{curr_player.name}, please input move: "
    input = gets.chomp
    break if input.downcase == "quit" || avail_moves.include?(input.to_i)
    puts "Please input an available move: #{avail_moves} or ['quit']"
  end

  return input
end


# 
# processes player turns
# returns "quit", "winner", and "draw" for endgame
# 
def player_turn(curr_player, opponent, ttt)
  avail_moves = ttt.open_squares(opponent.moves, curr_player.moves)
  
  #
  # CPU player processing
  #
  if curr_player.cpu == true                                            
    node = Minimax.new [opponent.moves, curr_player.moves], avail_moves
    node.create_minimax_tree(ttt)
    next_move = node.select_computer_move
    input = next_move[0]
    puts "CPU Turn: #{input}"
  else  # Human player processing
    input = valid_move(curr_player, avail_moves)
    return "quit" if input.downcase == "quit"
  end

  #
  # record and display move
  #
  ttt.mark_board(input.to_i, curr_player.mark)
  curr_player.move(input.to_i)
  ttt.display     

  #
  # check for winner or draw status
  # 
  if ttt.winner?(curr_player.moves)                                    
    puts "#{curr_player.name} wins!!"
    return "winner"
  elsif ttt.draw?(curr_player.moves, opponent.moves)                    
    puts "Game ends in draw."
    return "draw"
  end
end


#
# initialize gameboard
#
ttt = TicTacToe.new 9, 3


#
# display instructions  
#                                            
ttt.instructions                                                      


#
# player setup
#
print "Would you like to go first (y/n): "
if gets.chomp == "y"
  p1 = Player.new "X"
  print "Player 1, enter name: "
  p1.name = gets.chomp

  p2 = Player.new "O", "cpu", true
else
  p2 = Player.new "X"
  print "Player 1, enter name: "
  p2.name = gets.chomp

  p1 = Player.new "O", "cpu", true
end


#
# game loop
#
loop do                                                               

  # 
  # determin whose turn it is
  # odd num of open squares => p1 turn
  # even num of open squares => p2 turn
  #
  if ttt.open_squares(p1.moves, p2.moves).length.odd?
    curr_player_turn = p1
    opponent = p2 
  else ttt.open_squares(p1.moves, p2.moves).length.even? 
    curr_player_turn = p2
    opponent = p1      
  end  

  turn_result = player_turn(curr_player_turn, opponent, ttt) 
  break if turn_result == "quit" || turn_result == "winner" || turn_result == "draw"   
end







