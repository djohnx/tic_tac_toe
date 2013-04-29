class Minimax
  attr_accessor :children, :parent, :data, :score, :depth, :avail_moves

  def initialize(data=nil, avail_moves=0, depth=0, parent=nil)
    @children = []
    @parent = parent
    @score = 0
    @depth = depth
    @data = data                                                              
    @avail_moves = avail_moves
  end


  #
  # receieves TicTacToe object
  # Generates full game tree for tic tac toe 
  # uses minimax algorithm
  #
  def create_minimax_tree(ttt)
  

    #
    # Checks for all possible endgame scenarios
    # If true: sets @score & resets @avail_moves
    #
    if ttt.winner?(current_player)                               
      set_score
      @avail_moves = []
      return @score
    elsif ttt.draw?(@data[min_player], @data[max_player]) || difficulty_level_limit(EXPERT) || computer_opens_game                                 
      @avail_moves = []
      return @score
    end


    #
    # Creates a child node for each @avail_moves value in current node
    #
    generate_tree_nodes(ttt)


    #
    # Recursively calls each new child node created
    # Returns score values for sibling nodes, stores in score_array 
    #
    score_array = []
    @children.each do |n|
      node_score = n.create_minimax_tree(ttt)
      score_array << node_score
    end


    #
    # Sets current node @score value 
    # If @depth even, receives max score from score_array (children node score values)
    # If @depth odd, receives min score from score_array (children node score values)
    #
    @score = @depth.even? ? score_array.max : score_array.min

    return @score
  end




  #
  # returns current player @data value
  # @depth even = min player, @depth odd = max player
  #
  def current_player
    return @data[@depth.even? ? min_player : max_player]
  end


  #
  # returns index value of 0
  # @data[0] represents min player moves
  #
  def min_player
    return 0
  end


  #
  # returns index value of 1
  # @data[1] represents max player moves
  #
  def max_player
    return 1
  end


  #
  # @depth even sets score for min player
  # @depth odd sets score for max player
  #
  def set_score
    @depth.even? ? set_score_for_min_player : set_score_for_max_player 
  end


  #
  # Sets negative @score value for min player
  # Lowest value scores respresent next best move
  #
  def set_score_for_min_player
    @score = -1.0 / @depth
  end


  #
  # Sets positive @score value for max player
  # Highest value scores respresent next best move
  #
  def set_score_for_max_player
    @score = 1.0 / @depth
  end


  #
  # Sets level of difficulty for computer player
  # MAX = 6 (CPU processes to 6 moves ahead)
  # returns true for depth = MAX, false for < MAX
  #
  def difficulty_level_limit(level)
    @depth == level ? true : false 
  end


  #
  # Speeds up first move when CPU opens game
  # When game opens, no winning/losing move exists  
  # returns true when this is the case, otherwise false
  #
  def computer_opens_game
    @avail_moves.length == 8 && @depth == 1 ? true : false
  end



  #
  # creates new child node for each available move
  # receives tic_tac_toe object
  #
  def generate_tree_nodes(ttt)
    while !@avail_moves.empty?
      player_moves = create_new_players_moves_array
      player_makes_move(player_moves)
      create_new_child_node(ttt, player_moves)
    end
  end


  #
  # creates duplicate of current move array
  # used as starting point for child node move data
  #
  def create_new_players_moves_array
    player_moves = Array.new(2) { Array.new }
    player_moves[0] = @data[0].dup
    player_moves[1] = @data[1].dup   
    return player_moves 
  end


  #
  # Even @depth values - min player makes move 
  # Odd @depth values - max player makes move
  # receives new data array
  #
  def player_makes_move(player_moves)
    @depth.even? ? min_player_moves(player_moves) : max_player_moves(player_moves)
  end


  #
  # min player makes move
  # receives new data array
  #
  def min_player_moves(player_moves)
    player_moves[1] << @avail_moves.shift
  end


  #
  # max player makes move
  # receives new data array
  #
  def max_player_moves(player_moves)
    player_moves[0] << @avail_moves.shift
  end


  #
  # creates a new child node
  # receives tic_tac_toe object and new data array
  #
  def create_new_child_node(ttt, player_moves)
    avail_moves = ttt.open_squares(player_moves[0], player_moves[1])
    @children << Minimax.new(player_moves, avail_moves, (@depth + 1), self)  
  end


  #
  # returns computer move value 
  #
  def select_computer_move
    data_of_matched_nodes = []

    #
    # identify children nodes where @score value equals parent node @score value 
    # identical values = best next move
    #
    @children.each do |n|
      if n.score == @score
        data_of_matched_nodes << n.data[1]                                                
      end
    end


    #
    # randomly select next move data 
    # Identical min/max scores could exist
    # 
    next_move_data = randomly_select(data_of_matched_nodes)
                

    #
    # return next move value
    # @data[1] represents current data of parent node
    # next_move_data represents child node data
    # subtract the two to get next move value
    #
    return next_move_data - @data[1]  
  end  


  #
  # receive data of machted nodes
  # return move data
  #
  def randomly_select(data_of_matched_nodes)
    return data_of_matched_nodes[rand(data_of_matched_nodes.length)] 
  end


  private
    EXPERT = 6

end