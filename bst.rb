# Build a class Node. It should have a value that it stores and also links to its parent and children (if they exist). Build getters and setters for it (e.g. parent node, child node(s)).

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

# Write a method build_tree which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of Node objects appropriately placed. Start by assuming the array you get is sorted.

def build_tree arr
	current_value = arr.shift
  comparison_node = nil
	until current_value == nil and arr.size == 0
    if comparison_node == nil
      # root node
      current_node = Node.new val: current_value, root: true
      comparison_node = current_node

      # So we create the root node in the first branch.

    elsif current_value < comparison_node.value
      # check for the child of the comparison node whose value is less than the comparison node. 
        # IF IT EXISTS, make that node the new comparison node
        # IF IT DOESN'T, make a new node with the current_vale
            # ALSO, update the child of the comparison node, and pass the comparison_node as the parent of the new node
    elsif current_value > comparison_node.value
      # if the current_value is greater than the comparison_node's value, then either
      if comparison_node.rchild_node == nil
        # 1) It becomes the comparison_node's new rchild_node, or
        new_rchild = Node.new val: current_value, parent: comparison_node
        comparison_node.rchild_node = new_rchild
      else
        # 2) The comparison_node already has an rchild_node, and the new comparison node needs to be that existing rchild_node
        comparison_node = comparison_node.rchild_node

      end
    end

    current_value = arr.shift
  end
end

#build_tree [1,3,2]
		
# So how are we building this tree?
  # Some necessary steps:
    # 1) Create a node for each number in the array
    # 2) 

# The first node will not have parents or children. It will be the root.
# The second node will be the child of the first node (its parent will be the first node). 
  # Hence, we will need to update the first node's child value (which, before we update, will be nil.)


# is a Tree object necessary? 
	# A: I don't think so. Each node in a tree is connected to at least one other node.


# NEXT: learn what a binary tree is LUL
		# specifically, how to add numbers to the tree
		# A: always start at the root, then go left (if number is less than root) or right (if number is greater)



# TWO big things that we're looping through
  # The numbers in the array
  # The nodes in the tree




# FIRST FIRST
  # We shift the first number from the array, and create our root node.


def rbuild_tree arr
  # 1) We get the first number from the array and create our root node
  root_node = Node.new value: arr.shift, root: true
  current_node = root_node

  # 2) We get the next number from the array
  num = arr.shift
    # a) Is it smaller than the root?
  until num == nil and arr.size == 0
    if num < current_node.value
      if current_node.lchild_node
        current_node = current_node.lchild_node
      else
        new_node = Node.new value: num, parent: current_node
        current_node.lchild_node = new_node

        current_node = root_node

        num = arr.shift
          # Yes? 
            # Does the root have a lchild_node?
              # Yes?
                # Make that lchild_node the "current" node
              # No?
                # Create a node with the number, 
    # b) Is it bigger?
      end
    elsif num > current_node.value
      # Yes?
      # Does the root have rchild_node?
      if current_node.rchild_node 
        # Yes?
        # Make that rchild_node the "current" node
        current_node = current_node.rchild_node
      else
        # No?
        # Create a node with the number, and whose parent is the root. Update the root's rchild_node
        new_node = Node.new value: num, parent: current_node
        current_node.rchild_node = new_node

        current_node = root_node

        num = arr.shift
        # Also, change the current_node to the root node, so that when we take the new number, we start comparisons at the root.
      end
    else
      num = arr.shift
      current_node = root_node
    end

  end

  root_node


end

p rbuild_tree [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
  # 1) We get the first number from the array and create our root node
  # 2) We get the next number from the array
      # a) Is it smaller than the root?
          # Yes? 
            # Does the root have a lchild_node?
              # Yes?
                # Make that lchild_node the "current" node
              # No?
                # Create a node with the number, 
      # b) Is it bigger?
          # Yes?
            # Does the root have rchild_node?
              # Yes?
                # Make that rchild_node the "current" node
              # No?
                # Create a node with the number, and whose parent is the root. Update the root's rchild_node

  # 3) Now, we get the next number from the array
      # a) Is it smaller than the root?
        # Yes.
        # Does the root have a lchild node?
          # Yes.
            # Change current node to lchild node (of root)
              # Is our number smaller than this?
          # No.
            # The root has a new lchild node!

    
    # We're repeating as long as the current node has a relevant child.
      # We move onto the next number as soon as no relevant child exists!!!!!!!
