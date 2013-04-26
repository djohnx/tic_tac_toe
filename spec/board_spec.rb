require_relative 'spec_helper.rb'


describe 'board' do 

  before(:all) do
    @board = Board.new 9, 3
  end


  describe "squares variable" do
    it 'has a getter' do   
      @board.squares.should == [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    end

    it 'has a setter' do
      @board.squares = ['X','X','X','X','X','O','O','O','O']
      @board.squares.should == ['X','X','X','X','X','O','O','O','O']
    end
  end


  describe "width variable" do
    it 'has a getter' do
      @board.width.should == 3
    end

    it 'has a setter' do
      @board.width = 4
      @board.width.should == 4
    end  
  end


  describe "#mark_board(move, curr_player_mark)" do 
    it 'records move for current player on gameboard' do
      @player = Player.new("X")
      @board.mark_board(1,@player.mark)
      @board.squares[1].should == @player.mark
    end  
  end
end