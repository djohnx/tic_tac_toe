require_relative 'player'
require_relative 'board'
require_relative 'tic_tac_toe'
require_relative 'minimax'





def player_turn(curr_player,opponent, ttt)
  
  if curr_player.cpu == true

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
  end
end



ttt = TicTacToe.new 9, 3   # create tic tac toe game board object

ttt.instructions   # display instructions

p1 = Player.new "X"
p1.first_to_act = true
p1.name = "Human"

p2 = Player.new "O"
p2.name = "cpu"
p2.cpu = true

#p2 = Player.new "X"
#p2.first_to_act = true
#p2.name = "Human"

#p1 = Player.new "O"
#p1.first_to_act = true
#p1.name = "cpu"
#p1.cpu = true



turn_count = 1
loop do 
     
  str = player_turn(p1, p2, ttt) if turn_count.odd?  
  str = player_turn(p2, p1, ttt) if turn_count.even?  
  break if str == "quit" || str == "winner"    

  if ttt.draw?(p1.moves, p2.moves)
    puts "Game ends in draw."
    break
  end
  turn_count += 1
end



