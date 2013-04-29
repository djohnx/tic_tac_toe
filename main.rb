require_relative 'player'
require_relative 'board'
require_relative 'tic_tac_toe'
require_relative 'minimax'


# checks validity of human player input
# infinity loop for invalid values
# breaks and returns input for valid entry
def valid_move(curr_player, avail_moves)
  input = ""

  loop do 
    print "#{curr_player.name}, please input move: "
    input = gets.chomp
    break if input.downcase == "quit" || avail_moves.include?(input.to_i)
    puts
    puts "Please input an available move: #{avail_moves} or ['quit']"
    puts
  end

  return input
end

# processes a player turn for both a human
# and cpu player
# returns "quit", "winner", and "draw" for
# end game notification
def player_turn(curr_player, opponent, ttt)
  avail_moves = ttt.open_squares(opponent.moves, curr_player.moves)
  
  if curr_player.cpu == true                                            # CPU turn processing
    puts "CPU is thinking..."
    moves = [opponent.moves, curr_player.moves]
    node = Minimax.new moves, avail_moves
    node.create_minimax_tree(ttt)

    next_move = node.select_computer_move
    input = next_move[0]
    puts "CPU Turn: #{input}"
  else                                                                  # Human player processing
    input = valid_move(curr_player, avail_moves)
    return "quit" if input.downcase == "quit"
  end

  #ttt.turn(curr_player, input.to_i)                                     # records move
  ttt.mark_board(input.to_i, curr_player.mark)
  curr_player.move(input.to_i)
  ttt.display                                                           # displays updated board
  if ttt.winner?(curr_player.moves)                                     # evaluates for winning move
    puts "#{curr_player.name} wins!!"
    return "winner"
  elsif ttt.draw?(curr_player.moves, opponent.moves)                    # evaluates for draw
    puts "Game ends in draw."
    return "draw"
  end
end



ttt = TicTacToe.new 9, 3                                              # create tic tac toe game board object

ttt.instructions                                                      # display instructions

# create player 1 object
p1 = Player.new "X"
print "Player 1, enter name: "
p1.name = gets.chomp
print "Would you like to go first (y/n): "
gets.chomp == "y" ? p1.first_to_act = true : p1.first_to_act = false
puts

# create player 2 object
p2 = Player.new "O"
p2.name = "cpu"
p2.cpu = true



loop do                                                               # infinity move loop

  # if else statements check to see who turn it is,
  # then set respective "curr_player_turn" and
  # "not_player_turn" values
  if ttt.open_squares(p1.moves, p2.moves).length.odd? && p1.first_to_act == true
    curr_player_turn = p1
    not_player_turn = p2
  elsif ttt.open_squares(p1.moves, p2.moves).length.even? && p1.first_to_act == true
    curr_player_turn = p2
    not_player_turn = p1   
  elsif ttt.open_squares(p1.moves, p2.moves).length.odd? && p1.first_to_act == false
    curr_player_turn = p2
    not_player_turn = p1   
  elsif ttt.open_squares(p1.moves, p2.moves).length.even? && p1.first_to_act == false
    curr_player_turn = p1
    not_player_turn = p2  
  end  

  game_result = player_turn(curr_player_turn, not_player_turn, ttt) 
  break if game_result == "quit" || game_result == "winner" || game_result == "draw"   

end



