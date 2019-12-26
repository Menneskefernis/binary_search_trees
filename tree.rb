require_relative 'node'

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def insert(node = root, value)

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


  def delete(node = root, value)
  
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
end

  
