require_relative 'node'
require_relative 'tree'

#unique_and_sorted = prepare_array()
#tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)

puts "Balanced?: " + tree.balanced?.to_s
puts "Level: " + tree.level_order.to_s
puts "Pre: " + tree.preorder.join(', ')
puts "In: " + tree.inorder.join(', ')
puts "Post: " + tree.postorder.join(', ')
puts ""
tree.insert(283)
tree.insert(937)
tree.insert(105)
tree.insert(284)
tree.insert(5883)
puts "Balanced?: " + tree.balanced?.to_s
tree.rebalance!
puts "Balancing..."
puts "Balanced?: " + tree.balanced?.to_s
puts ""
puts "Level: " + tree.level_order.to_s
puts "Pre: " + tree.preorder.join(', ')
puts "In: " + tree.inorder.join(', ')
puts "Post: " + tree.postorder.join(', ')

#tree.delete(9)
#puts tree.root

#puts tree.find(23).data

#puts tree.level_order

#puts tree.preorder
#puts "------------"
#puts tree.inorder
#puts "------------"
#puts tree.postorder
#tree.to_s
#puts tree.depth(tree.find(8))
#puts tree.level_order.map { |node| node.data }.join(', ')

#tree.insert(10)
#tree.insert(11)
#puts tree.depth(tree.find(67))
#puts tree.balanced?
#tree.rebalance!
#puts tree.level_order.map { |node| node.data }.join(', ')
#puts tree.balanced?