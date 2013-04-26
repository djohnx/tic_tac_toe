require_relative 'player'
require_relative 'board'
require_relative 'tic_tac_toe'
require_relative 'minimax'


def find_winning_node(node)
  score_depth_ary = []
  

  #if node.children.size == 0 && node.score > 0
    
  #  puts "Depth: #{node.depth}"
  #  puts "Score: #{node.score}"
  #  return [node.depth,node.score]
  #end

  return [node.depth, node.score] if node.children.size == 0 && node.score > 0
  node.children.each { |n| score_depth_ary << find_winning_node(n) } if node.children != nil
  
  #if node.children != nil
  #  node.children.each do |n|
  #    score_depth_ary << find_winning_node(n)
  #  end
  #end

  return score_depth_ary.flatten
end




ttt = TicTacToe.new 9, 3
node = Minimax.new [[0,2],[1,3]], [4,5,6,7,8]
node.generate_tree(ttt)

test = find_winning_node(node)
puts "#{test}"
