require_relative 'node'
require_relative 'tree'

def prepare_array(array)
  array.uniq
    .sort { |a, b| a > b ? 1 : -1 }
end

unique_and_sorted = prepare_array([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree = Tree.new(unique_and_sorted)

#tree.insert(10)
#puts tree.root.right_child.left_child.left_child.right_child.data


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
puts tree.level_order.map { |node| node.data }.join(', ')

tree.insert(10)
tree.insert(11)
#puts tree.depth(tree.find(67))
puts tree.balanced?
tree.rebalance!
puts tree.level_order.map { |node| node.data }.join(', ')
puts tree.balanced?