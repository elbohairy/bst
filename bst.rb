# Build a class Node. It should have a value that it stores and also links to
# its parent and children (if they exist). Build getters and setters for it
# (e.g. parent node, child node(s)).

class Node
	attr_accessor :parent_node, :rchild_node, :lchild_node, :value, :root

	def initialize value: nil, parent: nil, left_child: nil, right_child: nil,
                  root: false
		@value = value
		@parent_node = parent
		@lchild_node = left_child
    @rchild_node = right_child
    @root = root
	end
end


def build_tree arr
  root_node = Node.new value: arr.shift, root: true
  current_node = root_node


  num = arr.shift

  until num == nil and arr.size == 0
    if num < current_node.value
      if current_node.lchild_node
        current_node = current_node.lchild_node
      else
        new_node = Node.new value: num, parent: current_node
        current_node.lchild_node = new_node


        current_node = root_node
        num = arr.shift
      end
    elsif num > current_node.value
      if current_node.rchild_node 
        current_node = current_node.rchild_node
      else
        # Create a node with the number, and whose parent is the root. Update
        # the root's rchild_node
        new_node = Node.new value: num, parent: current_node
        current_node.rchild_node = new_node

        current_node = root_node
        num = arr.shift
        # Also, change the current_node to the root node, so that when we take
        # the new number, we start comparisons at the root.
      end
    else
      num = arr.shift
      current_node = root_node
    end

  end

  root_node


end

p build_tree [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
  