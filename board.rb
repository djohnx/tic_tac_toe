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
    i = 1
    squares.length.times do |n|
      print "  #{squares[n]}  "
      puts if i % width == 0
      i += 1
    end
  end

end






