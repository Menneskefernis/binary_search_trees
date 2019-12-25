class Node
  include Comparable
  sttr_accessor :data

  def <=>(other)
    data <=> other.data 
  end

  def initialize(data, left_child, right_child)
    @data = data
    @left_child = left_child
    @right_child = right_child
  end

  def build_tree

  end
end