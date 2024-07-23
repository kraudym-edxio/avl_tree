require 'helper'

class BinarySearchTreeTest < TestCase

  setup do
    @tree = BinarySearchTree.new
  end

  test 'can add root the element to the tree' do
    @tree.add("hello")
    assert @tree.contains?("hello")
  end

  test 'detects if an element exists in the tree' do
    assert_not @tree.contains?("hello")

    @tree.add("hello, world")
    @tree.add("hello, there")
    @tree.add("goodbye")

    assert_not @tree.contains?("hello")

    @tree.add("hello")

    assert @tree.contains?("hello")
  end

  test 'calculates the height of the tree' do
    assert_equal 0, @tree.height

    @tree.add("hello")
    assert_equal 1, @tree.height

    @tree.add("world")
    assert_equal 2, @tree.height
  end

  test 'it balances the tree when inserting right' do
    @tree.add("hello")
    @tree.add("hello, there")
    @tree.add("hello, world")

    assert_equal 2, @tree.height
  end

  test 'it balances the tree when inserting left' do
    @tree.add("hello, world")
    @tree.add("hello, there")
    @tree.add("hello")


    assert_equal 2, @tree.height
  end

  test 'calculates the number of elements in the tree' do
    @tree.add("hello")
    @tree.add("hello, there")
    @tree.add("hello, world")

    assert_equal 3, @tree.size
  end

  # Additional important test cases added
  test 'it rejects duplicate elements' do
    @tree.add("hello")
    assert @tree.contains?("hello")
    @tree.add("hello")
    assert_equal 1, @tree.size
  end

  test 'it balances when inserting in ascending order' do
    @tree.add("a")
    @tree.add("b")
    @tree.add("c")
    @tree.add("d")
    @tree.add("e")

    assert_equal 3, @tree.height
  end

  test 'it balances when inserting in descending order' do
    @tree.add("e")
    @tree.add("d")
    @tree.add("c")
    @tree.add("b")
    @tree.add("a")

    assert_equal 3, @tree.height
  end
end
