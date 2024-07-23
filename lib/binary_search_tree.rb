require 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(value)
    if contains?(value)
      # Ignore duplicates
      return
    end
    @root = add_recursively(@root, value)
  end

  def contains?(value)
    contains_recursive?(value, @root)
  end

  def size
    size_recursive(@root)
  end

  def height(node = @root)
    return 0 unless node
    node.height
  end

  private

  # Recursively adds a value to the tree. Updates node heights and balance the tree
  def add_recursively(node, value)
    return Node.new(value) unless node

    # Recursively add to left/right subtree depending on value comparison
    if value < node.value
      node.left = add_recursively(node.left, value)
    else
      node.right = add_recursively(node.right, value)
    end

    update_height(node)
    balance(node)
  end

  # Recursively checks if a value is present in the tree
  def contains_recursive?(value, node)
    return false if node.nil?

    # Check left/right subtree depending on value comparison
    if value < node.value
      contains_recursive?(value, node.left)
    elsif value > node.value
      contains_recursive?(value, node.right)
    else
      true  # If value equals current node's value return true
    end
  end

  # Recursively calculates the size of the tree
  def size_recursive(node)
    return 0 if node.nil?   # Base case
    1 + size_recursive(node.left) + size_recursive(node.right)   # Size = 1 (self) + left child size + right child size
  end

  # Updates the height of a node
  def update_height(node)
    node.height = [height(node.left), height(node.right)].max + 1   # Height of a node is the maximum of the children heights + 1
  end

  # Checks balance of a node to perform left or right rotation
  def balance(node)
    diff = height(node.right) - height(node.left)

    if diff < -1
      if height(node.left.left) >= height(node.left.right)
        node = rotate_right(node)
      else
        node.left = rotate_left(node.left)
        node = rotate_right(node)
      end
    elsif diff > 1
      if height(node.right.right) >= height(node.right.left)
        node = rotate_left(node)
      else
        node.right = rotate_right(node.right)
        node = rotate_left(node)
      end
    end

    node
  end

  # Left-rotation on a given node making its right child the new root of this subtree
  def rotate_left(node)
    new_root = node.right
    node.right = new_root.left
    new_root.left = node

    update_height(node)
    update_height(new_root)
    new_root
  end

  # Right-rotation on a given node making its left child the new root of this subtree
  def rotate_right(node)
    new_root = node.left
    node.left = new_root.right
    new_root.right = node

    update_height(node)
    update_height(new_root)
    new_root
  end
end
