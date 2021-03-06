# Thoughts
# => I wish Odin Project would clearly state how much slower DFS and BFS searches
# are for our purposes than simple binary search.
# => For the depth_first_search, I wish they provided a few more hints as to
# how to complete the method. E.g., is it actually necessary to have some
# record of previously visited nodes?
# => I didn't create a binary tree class. Perhaps a mistake. The instructions
# don't say one way or the other, though.
# => All in all, it was fun learning about this topic.


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

  # we loop until we've shifted all numbers from the array. We have both
  # conditions because nil can be an element of the array.
  until num == nil and arr.size == 0
    if num < current_node.value
      # we check to see if the current_node has a child
      if current_node.lchild_node
        # if it does, we repeat the loop and compare num against the child.
        current_node = current_node.lchild_node
      # this is the only time we shift a new num from arr--when
      # we create a new leaf node 
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

root = build_tree [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

def breadth_first_search root_node, target
  # takes a target value and returns the node at which it is located using the
  # breadth first search technique. Tip: You will want to use an array acting as
  # a queue to keep track of all the child nodes that you have yet to search and
  # to add new ones to the list (as you saw in the video). If the target node
  # value is not located, return nil.
  
  queue = []

  current_node = root_node

  queue.push current_node

  until queue.empty?
    current_node = queue.shift

    if current_node.value == target
      return current_node
    elsif current_node.lchild_node and current_node.rchild_node
      queue.push current_node.lchild_node
      queue.push current_node.rchild_node
    elsif current_node.lchild_node
      queue.push current_node.lchild_node
    elsif current_node.rchild_node
      queue.push current_node.rchild_node
   
    end

  end
  return nil
end

p breadth_first_search root, 67

def depth_first_search root_node, target
  # returns the node at which the target value is located using the depth first
  # search technique. Use an array acting as a stack to do this.
  
  stack = []
  # Couldn't think of a way to do this without recording which nodes
  # have already been visited
  visited = []

  current_node = root_node

  stack.unshift current_node

  until stack.empty?

    if current_node.lchild_node and !visited.include? current_node.lchild_node
      current_node = current_node.lchild_node

      visited.push current_node
      stack.unshift current_node

    elsif current_node.rchild_node and !visited.include? current_node.rchild_node
      current_node = current_node.rchild_node

      visited.push current_node
      stack.unshift current_node

    else
      x = stack.shift
      if x.value == target
        return x
      end

      current_node = x.parent_node
    end

  end

  return "nada"

end
p "nardos"
p depth_first_search root, 67



def dfs_rec node, target
  # so sexy how short this is.
  if node
    puts node.value
    return node if node.value == target
    dfs_rec node.lchild_node, target
    dfs_rec node.rchild_node, target
  end
end

p dfs_rec root, 67