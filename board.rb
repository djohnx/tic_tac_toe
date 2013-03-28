class Board
  attr_accessor :squares, :width

  def initialize(squares,width)
    self.squares = Array.new(squares)
    self.width = width
  end


  #
  # Prints out game board with player
  # moves marked on board
  #
  def display
    puts
    print "   #{squares[0]}   |"
    print "   #{squares[1]}   |"
    print "   #{squares[2]}   "
    puts
    print "----------------------"
    puts
    print "   #{squares[3]}   |"
    print "   #{squares[4]}   |"
    print "   #{squares[5]}   "
    puts
    print "----------------------"
    puts
    print "   #{squares[6]}   |"
    print "   #{squares[7]}   |"
    print "   #{squares[8]}   "
    puts  
    puts  
  end

end






