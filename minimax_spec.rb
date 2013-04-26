require_relative 'board'
require_relative 'tic_tac_toe'
require_relative 'minimax'
require_relative 'minimax_helper'

describe 'minimax' do 

  before(:all) do
    @ttt = TicTacToe.new 9, 3
  end

  describe '#generate_tree(ttt)' do
    context "--- Testing While Loop (new node creation) ---" do
      
      context "when avail_moves has a size of" do
        it '9, 9 new children nodes should be created' do
          node = Minimax.new [[],[]], [0,1,2,3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children.length.should == 9
        end
        it '8, 8 new children nodes should be created' do
          node = Minimax.new [[0],[]], [1,2,3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children.length.should == 8
        end    
        it '6, 6 new children nodes should be created' do
          node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children.length.should == 6
        end      
        it '3, 3 new children nodes should be created' do
          node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          node.generate_tree(@ttt)
          node.children.length.should == 3
        end    
        it '1, 1 new child node should be created' do
          node = Minimax.new [[0,2,4,3],[1,6,8,5]], [7]
          node.generate_tree(@ttt)
          node.children.length.should == 1
        end      
        it '0, 0 new child nodes should be created' do
          node = Minimax.new [[0,2,4,3,7],[1,6,8,5]], []
          node.generate_tree(@ttt)
          node.children.length.should == 0
        end              
      end

      context "when current node @depth value is" do
        it '0, child node depth value should be 1' do
          node = Minimax.new [[],[]], [0,1,2,3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children[0].depth.should == 1
        end      
        it '1, child node depth value should be 2' do
          node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children[0].children[0].depth.should == 2
        end   
        it '2, child node depth value should be 3' do
          node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children[0].children[0].children[0].depth.should == 3
        end      
        it '3, child node depth value should be 4' do
          node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children[0].children[0].children[0].children[0].depth.should == 4
        end                
      end  

      context "when data is created for a new node" do
        it 'the object_id for @data should be different for each node' do
          node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.data.object_id.should_not == node.children[0].data.object_id
        end                    
      end  

      context "children of current parent node" do
        it 'should all belong to the same parent' do
          node = Minimax.new [[0,2,3],[1,4,6]], [5,7,8]
          node.generate_tree(@ttt)
          node.should == (node.children[0].parent && node.children[1].parent && node.children[2].parent)
        end                    
      end  

      context "when @depth value is EVEN" do
        it 'player 2 (CPU) should make a move' do
          node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
          node.generate_tree(@ttt)
          node.data[1].count.should < node.children[0].data[1].count
        end                    
      end 

      context "when @depth value is ODD" do
        it 'player 2 (CPU) should NOT make a move' do
          node = Minimax.new [[0,2],[1]], [3,4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children[0].data[1].count.should == node.children[0].children[0].data[1].count
        end                    
      end 

      context "when @depth value is ODD" do
        it 'player 1 (Human) should make a move' do
          node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
          node.generate_tree(@ttt)
          node.children[0].data[0].count.should < node.children[0].children[0].data[0].count
        end                    
      end 

      context "when @depth value is EVEN" do
        it 'player 1 (Human) should NOT make a move' do
          node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
          node.generate_tree(@ttt)
          node.data[0].count.should == node.children[0].data[0].count
        end                    
      end 

      context "@data values for child nodes" do
        it 'should not be equal to siblings @data values' do
          node = Minimax.new [[0,2,4],[1,3,5]], [6,7,8]
          node.generate_tree(@ttt)
          node.children[0].data[1].should_not == node.children[1].data[1] 
          node.children[0].data[1].should_not == node.children[2].data[1]
          node.children[1].data[1].should_not == node.children[2].data[1]
        end                    
      end 
    end




    context "--- Testing setting of @score values ---" do
     
      context "parent nodes with EVEN @depth values" do
        it 'should receive Max @score value from children nodes' do
          node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
          node.generate_tree(@ttt)
          children_values = []
          node.children.each { |c| children_values << c.score }
          node.score.should == children_values.max
        end            
      end

      context "parent nodes with ODD @depth values" do
        it 'should receive Min @score value from children nodes' do
          node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
          node.generate_tree(@ttt)
          children_values = []
          node.children[1].children.each { |c| children_values << c.score }
          node.children[1].score.should == children_values.min
        end            
      end

      context "winning node" do
        it 'should have a @score value of 1 divided by @depth value' do
          node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
          node.generate_tree(@ttt)
          #find_winning_node(node) 
          #children_values = []
          #node.children[1].children.each { |c| children_values << c.score }
          #node.children[1].score.should == children_values.min
        end            
      end      
    end
  end

  # include test for setting level 0 score values ( 1 / @depth, -1 / @depth )
  # include test for unbeatable CPU

  describe '#next_move' do
      
    context "test return value" do
      it '9, 9 new children nodes should be created' do

      end     
    end

  end


end