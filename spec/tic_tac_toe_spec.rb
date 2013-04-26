require_relative 'spec_helper.rb'


describe 'tic_tac_toe' do 

  before(:all) do
    @ttt = TicTacToe.new 9, 3
  end


  describe "#winner?(player_moves)" do  
    it 'returns true for player moves containing [0,1,2]' do
      @ttt.winner?([4,0,1,2]).should == true
    end

    it 'returns true for player moves containing [3,4,5]' do
      @ttt.winner?([3,6,5,4]).should == true
    end

    it 'returns true for player moves containing [6,7,8]' do
      @ttt.winner?([8,7,6]).should == true
    end

    it 'returns true for player moves containing [0,3,6]' do
      @ttt.winner?([6,5,1,3,0]).should == true
    end

    it 'returns true for player moves containing [1,4,7]' do
      @ttt.winner?([4,7,1,0]).should == true
    end

    it 'returns true for player moves containing [2,5,8]' do
      @ttt.winner?([0,6,5,2,8]).should == true
    end

    it 'returns true for player moves containing [0,4,8]' do
      @ttt.winner?([0,6,4,8]).should == true
    end

    it 'returns true for player moves containing [2,4,6]' do
      @ttt.winner?([6,4,8,2]).should == true
    end

    it 'returns false for player moves containing 0 moves' do
      @ttt.winner?([]).should == false
    end  

    it 'returns false for player moves containing 1 move' do
      @ttt.winner?([4]).should == false
    end 

    it 'returns false for player moves containing 2 moves' do
      @ttt.winner?([0,3]).should == false
    end 

    it 'returns false for player moves containing 3 unwinning moves' do
      @ttt.winner?([1,3,5]).should == false
    end

    it 'returns false for player moves containing 4 unwinning moves' do
      @ttt.winner?([0,4,6,1]).should == false
    end

    it 'returns false for player moves containing 5 unwinning moves' do
      @ttt.winner?([0,2,5,3,7]).should == false
    end
  
  end

  describe "#open_squares(p1_moves, p2_moves)" do 
    it 'returns 9 available moves for p1_moves [] and p2_moves []' do
      @ttt.open_squares([],[]).size.should == 9
    end

    it 'returns 8 available moves for p1_moves [0] and p2_moves []' do
      @ttt.open_squares([0],[]).size.should == 8
    end

    it 'returns 7 available moves for p1_moves [0] and p2_moves [1]' do
      @ttt.open_squares([0],[1]).size.should == 7
    end

    it 'returns 6 available moves for p1_moves [0,2] and p2_moves [1]' do
      @ttt.open_squares([0,2],[1]).size.should == 6
    end

    it 'returns 5 available moves for p1_moves [0,2] and p2_moves [1,3]' do
      @ttt.open_squares([0,2],[1,3]).size.should == 5
    end

    it 'returns 4 available moves for p1_moves [0,2,4] and p2_moves [1,3]' do
      @ttt.open_squares([0,2,4],[1,3]).size.should == 4
    end

    it 'returns 3 available moves for p1_moves [0,2,4] and p2_moves [1,3,5]' do
      @ttt.open_squares([0,2,4],[1,3,5]).size.should == 3
    end                                     

    it 'returns 2 available moves for p1_moves [0,2,4,6] and p2_moves [1,3,5]' do
      @ttt.open_squares([0,2,4,6],[1,3,5]).size.should == 2
    end   

    it 'returns 1 available move for p1_moves [0,2,4,6] and p2_moves [1,3,5,7]' do
      @ttt.open_squares([0,2,4,6],[1,3,5,7]).size.should == 1
    end   

    it 'returns 0 available moves for p1_moves [0,2,4,6,8] and p2_moves [1,3,5,7]' do
      @ttt.open_squares([0,2,4,6,8],[1,3,5,7]).size.should == 0
    end           

    it 'returns available moves of [0,1,2,3,4,5,6,7,8] for p1_moves [] and p2_moves []' do
      @ttt.open_squares([],[]).should == [0,1,2,3,4,5,6,7,8]
    end

    it 'returns available moves of [1,2,3,4,5,6,7,8] for p1_moves [0] and p2_moves []' do
      @ttt.open_squares([0],[]).should == [1,2,3,4,5,6,7,8]
    end

    it 'returns available moves of [2,3,4,5,6,7,8] for p1_moves [0] and p2_moves [1]' do
      @ttt.open_squares([0],[1]).should == [2,3,4,5,6,7,8]
    end

    it 'returns available moves of [3,4,5,6,7,8] for p1_moves [0,2] and p2_moves [1]' do
      @ttt.open_squares([0,2],[1]).should == [3,4,5,6,7,8]
    end    

    it 'returns available moves of [4,5,6,7,8] for p1_moves [0,2] and p2_moves [1,3]' do
      @ttt.open_squares([0,2],[1,3]).should == [4,5,6,7,8]
    end    

    it 'returns available moves of [5,6,7,8] for p1_moves [0,2,4] and p2_moves [1,3]' do
      @ttt.open_squares([0,2,4],[1,3]).should == [5,6,7,8]
    end 

    it 'returns available moves of [6,7,8] for p1_moves [0,2,4] and p2_moves [1,3,5]' do
      @ttt.open_squares([0,2,4],[1,3,5]).should == [6,7,8]
    end 

    it 'returns available moves of [7,8] for p1_moves [0,2,4,6] and p2_moves [1,3,5]' do
      @ttt.open_squares([0,2,4,6],[1,3,5]).should == [7,8]
    end 

    it 'returns available moves of [8] for p1_moves [0,2,4,6] and p2_moves [1,3,5,7]' do
      @ttt.open_squares([0,2,4,6],[1,3,5,7]).should == [8]
    end 

    it 'returns available moves of [] for p1_moves [0,2,4,6,8] and p2_moves [1,3,5,7]' do
      @ttt.open_squares([0,2,4,6,8],[1,3,5,7]).should == []
    end 
  end


  describe "#draw?(p1_moves, p2_moves)" do 
    it 'returns false for p1_moves [], p2_moves []' do
      @ttt.draw?([],[]).should == false
    end

    it 'returns false for p1_moves [0], p2_moves []' do
      @ttt.draw?([0],[]).should == false
    end

    it 'returns false for p1_moves [0], p2_moves [1]' do
      @ttt.draw?([0],[1]).should == false
    end    

    it 'returns false for p1_moves [0,2], p2_moves [1]' do
      @ttt.draw?([0,2],[1]).should == false
    end  

    it 'returns false for p1_moves [0,2], p2_moves [1,3]' do
      @ttt.draw?([0,2],[1,3]).should == false
    end  

    it 'returns false for p1_moves [0,2,4], p2_moves [1,3]' do
      @ttt.draw?([0,2,4],[1,3]).should == false
    end  

    it 'returns false for p1_moves [0,2,4], p2_moves [1,3,5]' do
      @ttt.draw?([0,2,4],[1,3,5]).should == false
    end  

    it 'returns true for p1_moves [0,2,3,7], p2_moves [1,4,5,6,8]' do
      @ttt.draw?([0,2,3,7],[1,4,5,6,8]).should == true
    end

    it 'returns true for p1_moves [0,2,3,7], p2_moves [1,4,6,5]' do
      @ttt.draw?([0,2,3,7],[1,4,6,5]).should == true
    end    

    it 'returns true for p1_moves [0,5,6,7], p2_moves [3,4,8,2]' do
      @ttt.draw?([0,5,6,7],[3,4,8,2]).should == true
    end      
  end
end