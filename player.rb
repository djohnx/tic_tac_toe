class Player
  attr_accessor :mark, :cpu, :name, :first_to_act
  attr_reader :moves

  def initialize(mark, name="",cpu=false)
    @mark = mark                                        # game piece, 'X' and 'O' for tic tac toe
    @cpu = cpu                                        # true = this is a cpu player, false = this is a human player
    @first_to_act = false                               # true = first player to move, false = second player to move
    @moves = []
    @name = name 
  end

  #
  # receives current move 
  # records move of current player
  #
  def move(move)
    @moves << move
  end

end



