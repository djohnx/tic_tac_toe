require_relative 'spec_helper.rb'


describe 'player' do 

  before(:all) do
    @player_1 = Player.new("X")
  end

  describe "mark variable" do
    it 'has a getter' do   
      @player_1.mark.should == "X"
    end

    it 'has a setter' do
      @player_1.mark = "O"
      @player_1.mark.should == "O"
    end
  end


  describe "cpu variable" do
    it 'has a getter' do   
      @player_1.cpu.should == false
    end

    it 'has a setter' do
      @player_1.cpu = true
      @player_1.cpu.should == true
    end
  end


  describe "name variable" do
    it 'has a getter' do   
      @player_1.name.should == ""
    end

    it 'has a setter' do
      @player_1.name = "Jeff"
      @player_1.name.should == "Jeff"
    end
  end


  describe "first_to_act variable" do
    it 'has a getter' do   
      @player_1.first_to_act.should == false
    end

    it 'has a setter' do
      @player_1.first_to_act = true
      @player_1.first_to_act.should == true
    end
  end


  describe "moves variable" do
    it 'has a getter' do   
      @player_1.moves.should == []
    end

    it 'should not have a setter method' do
      lambda { @player_1.moves = [1] }.should raise_error
    end
  end


  describe "#move(move)" do 
    it "adds player move of [1] to player's move list" do
      @player_1.move(1)
      @player_1.moves.include?(1).should == true
    end
    it "adds player move of [4] to player's move list" do
      @player_1.move(4)
      @player_1.moves.include?(4).should == true
    end        
    it "player's move list should contain moves [1,4]" do
      @player_1.moves.should == [1,4]
    end
    it "adds player move of [7] to player's move list" do
      @player_1.move(7)
      @player_1.moves.include?(7).should == true
    end
    it "player's move list should contain moves [1,4,7]" do
      @player_1.moves.should == [1,4,7]
    end               
  end  
end