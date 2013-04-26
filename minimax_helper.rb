def find_winning_node(node)
  score_depth_ary = []


    #if @depth < 2
      #puts "Data: #{@data}"
      #puts "Curr node: #{self}"
      #puts "Parent: #{@parent}"
      #puts "Depth: #{@depth}"
      #puts "Avail moves: #{@avail_moves}"      
     # puts "Score: #{@score}"
      #puts "Object id: #{@data.object_id}"
      #puts
    #end
  if node.children == nil && node.data > 0
    score_depth_ary
  end

  node.children.each { |n| n.traverse } if node.children != nil
    

end