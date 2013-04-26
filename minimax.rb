class Minimax
  attr_accessor :children, :parent, :data, :score, :depth, :avail_moves

  def initialize(data=nil, avail_moves=0, depth=0, parent=nil)
    @children = []
    @parent = parent
    @score = 0
    @depth = depth
    @data = data                                                              # Both players moves are stored in a 2D array (@data), index 0 = player 1, index 1 = player 2.
    @avail_moves = avail_moves
  end


  #
  # receieves TicTacToe object, necessary in determining end games 
  # and available moves. Generates full game tree for tic tac toe 
  # using minimax algorithm. Player turns are determined by node 
  # depth value.  Even depth (0,2,4..) receives Max values for best
  # move for Player 2 (CPU).  Odd depth (1,3,5..) receives Min value
  # for best move for Player 1.  It is always player 2 (CPU) turn
  # when function is called.  
  #
  def generate_tree(ttt)
    
    #
    # Sets and returns @score values and halts tree generation 
    # when an endgame is reached
    #
    if ttt.winner?(@data[@depth.even? ? 0 : 1])                               # @data[0] = player 1 moves, @data[1] = player 2 moves
      @depth.even? ? @score = -1.0 / @depth : @score = 1.0 / @depth           # helps identify shortest path to a winning move (i.e. 3 nodes of +1 value, which do you chose?), depth of 2 is better than depth of 4.  Odd @dpeth represent move by Player 2 (MAX)
      @avail_moves = []
      return @score
    elsif ttt.draw?(@data[0], @data[1])                                       # @data[0] = player 1 moves, @data[1] = player 2 moves
      @avail_moves = []
      return @score
    elsif @depth == 6                                                         # limits tree depth to 6 moves ahead, no loss in selection performance, improves speed for beginning moves
      @avail_moves = []
      return @score
    elsif @avail_moves.length == 8 && @depth == 1                             # When CPU is frist to act, first move is random (significantly speeds up game, all scores for depth 1 nodes are 0)
      @avail_moves = []
      return @score        
    end

    #
    # Creates a new node for each @avail_moves value in current node
    #
    while !@avail_moves.empty?
      new_board = Array.new(2) { Array.new }
      new_board[0] = @data[0].dup
      new_board[1] = @data[1].dup
      new_board[@depth.even? ? 1 : 0] << @avail_moves.shift                   # Generates moves for next level, not current level.  new_board[0] = player 1 moves, new_board[1] = player 2 (CPU) moves
      avail_moves = ttt.open_squares(new_board[0], new_board[1])
      @children << Minimax.new(new_board, avail_moves, (@depth + 1), self)  
    end

    #
    # Recursively calls each new node created, which evaluates each 
    # new node for end game, then if moves available creates new 
    # nodes (children). Returns score from each new node and adds 
    # to an array
    #
    score_array = []
    @children.each do |n|
      node_score = n.generate_tree(ttt)
      score_array << node_score
    end

    #
    # Determines @score value based on node @depth value. 
    # Even @depth value sets @score value to Max value
    # of childen nodes, indicating Player 2 (CPU) best move.  
    # Odd @depth value sets @score value to Min value
    # of children nodes, indicating Player 1 best move.
    #
    @score = @depth.even? ? score_array.max : score_array.min

    return @score
  end


  #
  # returns next move value 
  # Reads @score value from top node, then finds child with same 
  # @score value, then returns the move of that node when multiple 
  # moves share same @score value, random move is selected
  #
  def next_move
    next_move_data = []

    #
    # identify children with @score values that equal to current 
    # node (parent), identical values = best next move
    #
    @children.each do |n|
      if n.score == @score
        next_move_data << n.data                                                # multiple nodes can have chosen @score value, so store all (used to add variety to next move)
      end
    end

    random_next_move = next_move_data[rand(next_move_data.length)]              # randomly select next move (each move stored has identical @score value)

    #
    # return next move value
    #
    if  @data[0] == random_next_move[0]
      return random_next_move[1] - @data[1]
    else
      return random_next_move[0] - @data[0]
    end
  end  


  #
  # Used to help debug, prints out each tree node
  #
  def traverse
    #if @depth < 2
      puts "Data: #{@data}"
      #puts "Curr node: #{self}"
      #puts "Parent: #{@parent}"
      puts "Depth: #{@depth}"
      #puts "Avail moves: #{@avail_moves}"      
      puts "Score: #{@score}"
      #puts "Object id: #{@data.object_id}"
      puts
    #end
    @children.each { |n| n.traverse } if @children != nil    
  end

end