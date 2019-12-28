require_relative 'node'

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def insert(node=root, value)

    return Node.new(value) if node.nil? 

    if value < node.data 
      node.left_child = insert(node.left_child, value) 
    else
      node.right_child = insert(node.right_child, value)
    end

    return node
  end

  #def insert(value)
  #  new_node = Node.new(value)
  #  traversal_node = root
#
  #  until traversal_node.left_child.nil? || traversal_node.right_child.nil?
  #    new_node <= traversal_node ? traversal_node = traversal_node.left_child : traversal_node = traversal_node.right_child
  #  end
#
  #  new_node >= traversal_node ? traversal_node.right_child = new_node : traversal_node.left_child = new_node
  #end

  #def delete(value)
  #  traversal_node = root
  #  node_for_deletion = nil
#
  #  unless root.data == value
  #    until traversal_node.left_child.nil? || traversal_node.right_child.nil?
  #      value < traversal_node.data ? traversal_node = traversal_node.left_child : traversal_node = traversal_node.right_child
  #      
  #      if value == traversal_node.left_child.data
  #        node_for_deletion = traversal_node.left_child
  #        break
  #      elsif value == traversal_node.right_child.data
  #        node_for_deletion = traversal_node.right_child
  #        break
  #      end
  #    end
  #  end
#
  #  unless node_for_deletion.children?
  #    traversal_node.right_child == node_for_deletion ? traversal_node.right_child = nil : traversal_node.left_child = nil
  #  end
#
  #  if node_for_deletion.one_child?
  #    node_for_deletion.right_child ? traversal_node
  #  end
  #end


  def delete(node=root, value)
  
    # Base Case 
    return node if node.nil? 
  
    # If the key to be deleted is smaller than the root's 
    # key then it lies in  left subtree 
    if value < node.data 
        node.left_child = delete(node.left_child, value) 
  
    # If the kye to be delete is greater than the root's key 
    # then it lies in right subtree 
    elsif value > node.data
        node.right_child = delete(node.right_child, value) 
  
    # If key is same as root's key, then this is the node 
    # to be deleted 
    
    else 
          
      # Node with only one child or no child 
      if node.left_child.nil? 
        return node.right_child
        #node = nil 
        #return temp 
              
      elsif node.right_child.nil? 
        return node.left_child
        #node = nil 
        #return temp 
      end

    # Node with two children: Get the inorder successor 
     # (smallest in the right subtree) 
      temp = minValueNode(node.right_child) 

    # Copy the inorder successor's content to this node 
      node.data = temp.data

     # Delete the inorder successor 
      node.right_child = delete(node.right_child, temp.data) 
    end

    node
  end

  def minValueNode(node)
    current = node 
  
    # loop down to find the leftmost leaf 
    until current.left_child.nil?
        current = current.left_child
    end
    current
  end

  def find(data)
    return root if root.data == data
    current_node = root

    loop do
      data >= current_node.data ? current_node = current_node.right_child : current_node = current_node.left_child
      break if current_node.data == data
    end
    current_node
  end

  def level_order
    return if root.nil?

    queue = []
    queue << root

    queue.each do |node|
      queue << node.left_child if node.left_child
      queue << node.right_child if node.right_child
      yield node if block_given?
    end
    queue unless block_given?
  end

  def inorder(node=root, array=[])
    return if node.nil?

    yield node if block_given?

    preorder(node.left_child, array)
    array << node.data
    preorder(node.right_child, array)

    array
  end

  def preorder(node=root, array=[])
    return if node.nil?

    yield node if block_given?

    array << node.data
    preorder(node.left_child, array)
    preorder(node.right_child, array)

    array
  end

  def postorder(node=root, array=[])
    return if node.nil?

    yield node if block_given?

    preorder(node.left_child, array)
    preorder(node.right_child, array)
    array << node.data

    array
  end
  
  def depth(node, counter=0, levels=[])
    return if node.nil?

    depth(node.left_child, counter + 1, levels)
    depth(node.right_child, counter + 1, levels)
    levels << counter
    levels.max
  end

  def balanced?
    return true unless root.children?
    left_depth = self.depth(self.find(root.left_child.data)) if root.left_child
    right_depth = self.depth(self.find(root.right_child.data)) if root.right_child

    difference = (left_depth - right_depth).abs

    difference > 1 ? false : true
  end

  def to_s(node=root)
    return if node.nil?
    length = 40
    
    puts node.data.to_s.center(length)
    puts "\/ \\".center(length)
    puts "#{node.left_child.data if node.left_child}  #{node.right_child.data if node.right_child}".center(length)
    puts "\/ \\ \/ \\".center(length)
    puts "#{node.left_child.left_child.data}  #{node.left_child.right_child.data}\
          #{node.right_child.left_child.data}  #{node.right_child.right_child.data}".center(length)
    puts "\/ \\ \/ \\".center(length)
    puts "#{node.left_child.left_child.left_child.data} nil \
    #{node.right_child.left_child.left_child.data}  #{node.right_child.right_child.left_child.data}".center(length)
  end
end

  
