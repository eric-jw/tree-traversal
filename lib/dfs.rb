require 'thread'

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first_search(search_value)
    @children.each do |child|
      node = child.depth_first_search(search_value)
      return node if node
    end
    return self if @payload == search_value
  end

  def breadth_first_search(search_value)
    queue = [self]
    until queue.empty? do
      node = queue.shift
      return node if node.payload == search_value
      queue.concat(node.children)
    end
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])



#trunk.depth_first_search(11)
puts trunk.breadth_first_search(11).payload