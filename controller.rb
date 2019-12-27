require_relative 'node'
require_relative 'tree'

def create_node_array(array)
  array.uniq
    .sort { |a, b| a > b ? 1 : -1 }
    #.map { |element| Node.new(element) }
end
  
def build_tree(array)
  return nil if array.length < 1
    
  mid = array.length / 2
  
  root = Node.new(array[mid])
  root.left_child = build_tree(array.slice(0, mid))
  root.right_child = build_tree(array.slice(mid + 1, array.length))

  root
end

node_array = create_node_array([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree = Tree.new(node_array)

#tree.insert(10)
#puts tree.root.right_child.left_child.left_child.right_child.data


#tree.delete(9)
#puts tree.root

#puts tree.find(23).data

#puts tree.level_order

puts tree.preorder
puts "------------"
puts tree.inorder
puts "------------"
puts tree.postorder