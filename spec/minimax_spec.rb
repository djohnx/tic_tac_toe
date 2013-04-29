require_relative 'spec_helper.rb'

describe 'minimax' do 

  before(:all) do
    @ttt = TicTacToe.new 9, 3
  end

  describe '#generate_tree_nodes(ttt)' do
    context "9 available gameboard moves" do
      it 'should generate 9 children nodes' do 
        @node = Minimax.new [[],[]], [0,1,2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 9
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[],[]], [0,1,2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[],[0]]
        @node.children[1].data.should == [[],[1]]
        @node.children[2].data.should == [[],[2]]
        @node.children[3].data.should == [[],[3]]
        @node.children[4].data.should == [[],[4]]
        @node.children[5].data.should == [[],[5]]
        @node.children[6].data.should == [[],[6]]
        @node.children[7].data.should == [[],[7]]
        @node.children[8].data.should == [[],[8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[],[]], [0,1,2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node
        @node.children[1].parent.should == @node
        @node.children[2].parent.should == @node
        @node.children[3].parent.should == @node
        @node.children[4].parent.should == @node
        @node.children[5].parent.should == @node
        @node.children[6].parent.should == @node
        @node.children[7].parent.should == @node
        @node.children[8].parent.should == @node        
      end          
    end
    context "8 available gameboard moves" do
      it 'should generate 8 children nodes' do 
        @node = Minimax.new [[0],[]], [1,2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 8
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0],[]], [1,2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0],[1]]
        @node.children[1].data.should == [[0],[2]]
        @node.children[2].data.should == [[0],[3]]
        @node.children[3].data.should == [[0],[4]]
        @node.children[4].data.should == [[0],[5]]
        @node.children[5].data.should == [[0],[6]]
        @node.children[6].data.should == [[0],[7]]
        @node.children[7].data.should == [[0],[8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0],[]], [1,2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
        @node.children[1].parent.should == @node 
        @node.children[2].parent.should == @node 
        @node.children[3].parent.should == @node 
        @node.children[4].parent.should == @node 
        @node.children[5].parent.should == @node 
        @node.children[6].parent.should == @node 
        @node.children[7].parent.should == @node    
      end  
    end
    context "7 available gameboard moves" do
      it 'should generate 7 children nodes' do 
        @node = Minimax.new [[0],[1]], [2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 7
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0],[1]], [2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0],[1,2]]
        @node.children[1].data.should == [[0],[1,3]]
        @node.children[2].data.should == [[0],[1,4]]
        @node.children[3].data.should == [[0],[1,5]]
        @node.children[4].data.should == [[0],[1,6]]
        @node.children[5].data.should == [[0],[1,7]]
        @node.children[6].data.should == [[0],[1,8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0],[1]], [2,3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
        @node.children[1].parent.should == @node 
        @node.children[2].parent.should == @node 
        @node.children[3].parent.should == @node 
        @node.children[4].parent.should == @node 
        @node.children[5].parent.should == @node 
        @node.children[6].parent.should == @node    
      end       
    end
    context "6 available gameboard moves" do
      it 'should generate 6 children nodes' do 
        @node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 6
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0,2],[1,3]]
        @node.children[1].data.should == [[0,2],[1,4]]
        @node.children[2].data.should == [[0,2],[1,5]]
        @node.children[3].data.should == [[0,2],[1,6]]
        @node.children[4].data.should == [[0,2],[1,7]]
        @node.children[5].data.should == [[0,2],[1,8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
        @node.children[1].parent.should == @node 
        @node.children[2].parent.should == @node 
        @node.children[3].parent.should == @node 
        @node.children[4].parent.should == @node 
        @node.children[5].parent.should == @node   
      end        
    end
    context "5 available gameboard moves" do
      it 'should generate 5 children nodes' do 
        @node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 5
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0,2],[1,3,4]]
        @node.children[1].data.should == [[0,2],[1,3,5]]
        @node.children[2].data.should == [[0,2],[1,3,6]]
        @node.children[3].data.should == [[0,2],[1,3,7]]
        @node.children[4].data.should == [[0,2],[1,3,8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
        @node.children[1].parent.should == @node 
        @node.children[2].parent.should == @node 
        @node.children[3].parent.should == @node 
        @node.children[4].parent.should == @node   
      end          
    end
    context "4 available gameboard moves" do
      it 'should generate 4 children nodes' do 
        @node = Minimax.new [[0,2,4],[1,3]], [5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 4
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0,2,4],[1,3]], [5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0,2,4],[1,3,5]]
        @node.children[1].data.should == [[0,2,4],[1,3,6]]
        @node.children[2].data.should == [[0,2,4],[1,3,7]]
        @node.children[3].data.should == [[0,2,4],[1,3,8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0,2,4],[1,3]], [5,6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
        @node.children[1].parent.should == @node 
        @node.children[2].parent.should == @node 
        @node.children[3].parent.should == @node 
      end        
    end
    context "3 available gameboard moves" do
      it 'should generate 3 children nodes' do 
        @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 3
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0,2,4],[1,3,5,6]]
        @node.children[1].data.should == [[0,2,4],[1,3,5,7]]
        @node.children[2].data.should == [[0,2,4],[1,3,5,8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
        @node.children[1].parent.should == @node 
        @node.children[2].parent.should == @node 
      end        
    end
    context "2 available gameboard moves" do
      it 'should generate 2 children nodes' do 
        @node = Minimax.new [[0,2,4,6],[1,3,5]], [7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 2
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0,2,4,6],[1,3,5]], [7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0,2,4,6],[1,3,5,7]]
        @node.children[1].data.should == [[0,2,4,6],[1,3,5,8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0,2,4,6],[1,3,5]], [7,8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
        @node.children[1].parent.should == @node 
      end         
    end
    context "1 available gameboard moves" do
      it 'should generate 1 children nodes' do 
        @node = Minimax.new [[0,2,4,6],[1,3,5,7]], [8]
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 1
      end
      it 'each child node should represent a unique new value' do 
        @node = Minimax.new [[0,2,4,6],[1,3,5,7]], [8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].data.should == [[0,2,4,6],[1,3,5,7,8]]
      end   
      it 'each child node should have same parent node' do 
        @node = Minimax.new [[0,2,4,6],[1,3,5,7]], [8]
        @node.generate_tree_nodes(@ttt)        
        @node.children[0].parent.should == @node 
      end         
    end                
    context "0 available gameboard moves" do
      it 'should generate 0 children nodes' do 
        @node = Minimax.new [[0,2,4,6,8],[1,3,5,7]], []
        @node.generate_tree_nodes(@ttt)        
        @node.children.size.should == 0
      end
    end
  end

  describe '#generate_tree_nodes(ttt)' do
    before(:each) do
      @node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
      @player_moves = @node.create_new_players_moves_array
    end

    describe '#create_new_players_moves_array' do    
      context "object id of current array" do
        it 'should not equal object id of new array' do         
          @player_moves.object_id.should_not == @node.data.object_id
        end
      end
      context "data values of current array" do
        it 'should equal data values of new array' do
          @player_moves[0].should == @node.data[0]
          @player_moves[1].should == @node.data[1]
        end
      end    
    end

    describe '#min_player_moves(player_moves)' do    
      context "min player move's array" do
        it 'should increase array size by 1' do
          expect { @node.min_player_moves(@player_moves
            ) }.to change(@player_moves[1], :size).by(1)   
        end
      end
      context "max player move's array" do
        it 'should stay the same array size' do
          expect { @node.min_player_moves(@player_moves
            ) }.to change(@player_moves[0], :size).by(0)   
        end
      end
      context "avail_moves array for min player" do
        it 'should decrease array size by 1' do
          expect { @node.min_player_moves(@player_moves
            ) }.to change(@node.avail_moves, :size).by(-1)   
        end
      end      
    end

    describe '#max_player_moves(player_moves)' do    
      context "max player move's array" do
        it 'should increase array size by 1' do
          expect { @node.max_player_moves(@player_moves
            ) }.to change(@player_moves[0], :size).by(1)   
        end
      end
      context "min player move's array" do
        it 'should stay the same array size' do
          expect { @node.max_player_moves(@player_moves
            ) }.to change(@player_moves[1], :size).by(0)   
        end
      end   
      context "avail_moves array for max player" do
        it 'should decrease array size by 1' do
          expect { @node.max_player_moves(@player_moves
            ) }.to change(@node.avail_moves, :size).by(-1)   
        end
      end         
    end

    describe '#create_new_child_node(ttt,player_moves)' do    
      context "children array of parent node" do
        it 'should increase array size by 1' do
          @node.max_player_moves(@player_moves)
          expect { @node.create_new_child_node(@ttt, @player_moves
            ) }.to change(@node.children, :size).by(1)
        end      
      end
      context "child node of parent node" do
        it 'should have @depth value increase by 1' do
          @node.max_player_moves(@player_moves)
          @node.create_new_child_node(@ttt, @player_moves)
          (@node.children[0].depth - @node.depth).should == 1
        end        
      end         
    end
  end

  describe '#create_minimax_tree(ttt)' do
    context "a winning gameboard node" do
      it 'should have no children node values' do
        @node = Minimax.new [[0,1,2],[4,6,8]], [3,5,7]
        @node.create_minimax_tree(@ttt)
        @node.children.should == []
      end
    end  
    context "a draw gameboard node" do
      it 'should have no children node values' do
        @node = Minimax.new [[0,6,4,5],[1,3,2,8]], [7]
        @node.create_minimax_tree(@ttt)
        @node.children.should == []
      end   
    end
    context "a depth_limit_reached gameboard node" do
      it 'should have no children node values' do
        @node = Minimax.new [[0,6,4],[1,3,2]], [5,7,8]
        @node.depth = 6
        @node.create_minimax_tree(@ttt)
        @node.children.should == []
      end   
    end
    context "a computer_opens_game gameboard node" do
      it 'should have no children node values' do
        @node = Minimax.new [[0],[]], [1,2,3,4,5,6,7,8]
        @node.depth = 1
        @node.create_minimax_tree(@ttt)
        @node.children.should == []
      end            
    end
    context "if gameboard node doesn't meet any of the above conditions" do
      it 'should have children node values' do
        @node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
        @node.create_minimax_tree(@ttt)
        @node.children.should_not == []
      end
    end  

    context "for @depth value even" do
      it 'should return max @score value of children nodes' do
        @node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
        @node.create_minimax_tree(@ttt)
        score_values = []
        @node.children.each { |c| score_values << c.score }
        @node.score.should == score_values.max
      end
    end  
    context "for @depth value odd" do
      it 'should return min @score value of children nodes' do
        @node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
        @node.create_minimax_tree(@ttt)
        score_values = []
        @node.children[1].children.each { |c| score_values << c.score }
        @node.children[1].score.should == score_values.min
      end
    end  


    describe "#current_player" do
      context "@data index value for min player" do
        it 'should be 0' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]        
          @node.current_player.should == @node.data[0]
        end  
      end
      context "@data index value for max player" do
        it 'should be 1' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 1        
          @node.current_player.should == @node.data[1]
        end    
      end
      describe "#min_player" do
        context "return value for min player" do
          it 'should be 0' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]    
            @node.min_player.should == 0
          end    
        end
      end
      describe "#max_player" do
        context "return value for max player" do
          it 'should be 1' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]      
            @node.max_player.should == 1
          end    
        end
      end
    end

    describe "#set_score" do
      context "@depth even value" do
        it 'should set score value using min player value' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 2        
          @node.set_score
          @node.score.should == -0.5
        end  
      end
      context "@depth odd value" do
        it 'should set score value using max player value' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 1        
          @node.set_score
          @node.score.should == 1
        end  
      end      

      describe "#set_score_for_min_player" do
        context "for @depth value of 1" do
          it '@score value should be -1' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 1      
            @node.set_score_for_min_player.should == -1
          end  
        end
        context "for @depth value of 2" do
          it '@score value should be -.5' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 2     
            @node.set_score_for_min_player.should == -0.5
          end  
        end
        context "for @depth value of 3" do
          it '@score value should be -.33' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 3     
            @node.set_score_for_min_player.round(2).should == -0.33
          end  
        end  
        context "for @depth value of 4" do
          it '@score value should be -.25' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 4     
            @node.set_score_for_min_player.should == -0.25
          end  
        end  
        context "for @depth value of 5" do
          it '@score value should be -.2' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 5     
            @node.set_score_for_min_player.should == -0.2
          end  
        end  
        context "for @depth value of 6" do
          it '@score value should be -.17' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 6     
            @node.set_score_for_min_player.round(2).should == -0.17
          end  
        end                                
      end  

      describe "#set_score_for_max_player" do
        context "for @depth value of 1" do
          it '@score value should be 1' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 1     
            @node.set_score_for_max_player.should == 1
          end  
        end
        context "for @depth value of 2" do
          it '@score value should be .5' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 2     
            @node.set_score_for_max_player.should == 0.5
          end  
        end
        context "for @depth value of 3" do
          it '@score value should be .33' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 3     
            @node.set_score_for_max_player.round(2).should == 0.33
          end  
        end  
        context "for @depth value of 4" do
          it '@score value should be .25' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 4     
            @node.set_score_for_max_player.should == 0.25
          end  
        end  
        context "for @depth value of 5" do
          it '@score value should be .2' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 5     
            @node.set_score_for_max_player.should == 0.2
          end  
        end  
        context "for @depth value of 6" do
          it '@score value should be .17' do 
            @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]  
            @node.depth = 6     
            @node.set_score_for_max_player.round(2).should == 0.17
          end  
        end 
      end 
    end

    describe "#difficulty_level_limit(level)" do
      context "when level = 6, for @depth value of 0" do
        it 'should return false' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 0        
          @node.difficulty_level_limit(6).should == false
        end  
      end
      context "when level = 6, for @depth value of 1" do
        it 'should return false' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 1        
          @node.difficulty_level_limit(6).should == false
        end  
      end
      context "when level = 6, for @depth value of 2" do
        it 'should return false' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 2        
          @node.difficulty_level_limit(6).should == false
        end  
      end
      context "when level = 6, for @depth value of 3" do
        it 'should return false' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 3        
          @node.difficulty_level_limit(6).should == false
        end  
      end
      context "when level = 6, for @depth value of 4" do
        it 'should return false' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 4        
          @node.difficulty_level_limit(6).should == false
        end  
      end
      context "when level = 6, for @depth value of 5" do
        it 'should return false' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 5        
          @node.difficulty_level_limit(6).should == false
        end  
      end
      context "when level = 6, for @depth value of 6" do
        it 'should return true' do 
          @node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          @node.depth = 6        
          @node.difficulty_level_limit(6).should == true
        end  
      end                                          
    end

    describe "#computer_opens_game" do
      context "if computer player makes opening game move" do
        it 'should return true' do 
          @node = Minimax.new [[0],[]], [1,2,3,4,5,6,7,8]   
          @node.depth = 1  
          @node.computer_opens_game.should == true
        end  
      end
      context "if human player makes opening game move" do
        it 'should return false' do 
          @node = Minimax.new [[0],[1]], [2,3,4,5,6,7,8]   
          @node.depth = 2  
          @node.computer_opens_game.should == false
        end  
      end                                       
    end
  end
end