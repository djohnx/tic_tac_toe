require_relative 'player'
require_relative 'board'
require_relative 'tic_tac_toe'
require_relative 'minimax'



def player_turn(curr_player,opponent, ttt)
  
  if curr_player.cpu == true
    puts "CPU in thinking..."
    avail_moves = ttt.open_squares(opponent.moves, curr_player.moves)
    moves = [opponent.moves, curr_player.moves]
    node = Minimax.new moves, avail_moves
    node.generate_tree(ttt)

    next_move = node.next_move
    input = next_move[0]
    puts "CPU Turn: #{input}"
  else
    print "#{curr_player.name}, please input move: "
    input = gets.chomp
    return "quit" if input.downcase == "quit"
  end

  ttt.turn(curr_player, input.to_i)
  ttt.display  
  if ttt.winner?(curr_player.moves)
    puts "#{curr_player.name} wins!!"
    return "winner"
  elsif ttt.draw?(curr_player.moves, opponent.moves)
    puts "Game ends in draw."
    return "draw"
  end
end



ttt = TicTacToe.new 9, 3   # create tic tac toe game board object

ttt.instructions   # display instructions

p1 = Player.new "X"
print "Player 1, enter name: "
p1.name = gets.chomp
print "Would you like to go first (y/n): "
gets.chomp == "y" ? p1.first_to_act = true : p1.first_to_act = false
puts

p2 = Player.new "O"
p2.name = "cpu"
p2.cpu = true



loop do 

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



