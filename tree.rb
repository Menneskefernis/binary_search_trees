require_relative 'node'

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def insert(value)
    new_node = Node.new(value)
    traversal_node = root

    until traversal_node.left_child.nil? || traversal_node.right_child.nil?
      if new_node <= traversal_node
        traversal_node = traversal_node.left_child

      elsif new_node > traversal_node
        traversal_node = traversal_node.right_child
      end
    end

    new_node >= traversal_node ? traversal_node.right_child = new_node : traversal_node.left_child = new_node
  end

  def delete(new_node)

  end
end