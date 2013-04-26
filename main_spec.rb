require_relative 'board'
require_relative 'tic_tac_toe'
require_relative 'player'
require_relative 'main'


describe 'main' do
  
  describe "#valid_move(curr_player, avail_moves)" do
    it 'returns true for player moves [0,1,2]' do
      curr_player = Player.new "X"
      m = Main.new
      input = 1
      m.valid_move(curr_player,[0,1,2]).should == 1
    end
  end  


end