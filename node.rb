class Node
  include Comparable
  attr_accessor :data, :left_child, :right_child

  def <=>(other)
    data <=> other.data 
  end

  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end

  def children?
    self.left_child.nil? && self.right_child.nil? ? false : true
  end

  def one_child?
    if !self.left_child.nil? && !self.right_child.nil?
      false
    elsif !self.left_child.nil? || !self.right_child.nil?
      true
    else
      false
    end
  end
end

#1) Get the Middle of the array and make it root.
#2) Recursively do same for left half and right half.
#      a) Get the middle of left half and make it left child of the root
#          created in step 1.
#      b) Get the middle of right half and make it right child of the
#          root created in step 1.

#https://www.geeksforgeeks.org/sorted-array-to-balanced-bst/