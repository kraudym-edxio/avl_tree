# AVL Tree

## Setup
```shell
gem install bundler
bundle install
```

## Project Overview
```shell
├── Gemfile # Defines ruby dependencies for the project.
├── Gemfile.lock # Defines locked versions of dependencies that will be installed.
├── README.md
├── Rakefile # Defines tasks that this project runs, like tests.
├── lib # This directory stores your implementation for the BST.
│   ├── binary_search_tree.rb
│   └── node.rb
├── setup.rb # Sets up the environment and loads dependencies.
└── test # Any test files for your implementations can go here.
    ├── binary_search_tree_test.rb
    └── helper.rb # The helper provides a baseline to setup and run tests.
```

### Running Tests
`bundle exec rake test`

### Interactive Ruby Console
`bundle exec rake console`.

```shell
rake console
irb(main):001> tree = BinarySearchTree.new
=> #<BinarySearchTree:0x00000001098b88f0 @root=nil>
irb(main):002> tree.add("Hello, World!")
=> #<Node:0x000000010999d400 @value="Hello, World!">
irb(main):003> tree.contains?("Hello, World!")
=> true
```

```shell
bundle exec rake test
Run options: --seed 14696

# Running:
From: /.../binary_search_tree/lib/binary_search_tree.rb:8 BinarySearchTree#initialize:

    6: def initialize
    7:   binding.pry
 => 8:   @root = nil
    9: end

[1] pry(#<BinarySearchTree>)> @root
=> nil
[2] pry(#<BinarySearchTree>)> self
=> #<BinarySearchTree:0x0000000106eb73f8>
```

1. Overview
- AVL tree approach was used as per the assignment requirements
- Height of left and right child subtrees of every node differ by one **at most**
- Balance is achieved via a balance factor, left-rotate, and right-rotation (if balance_factor > 1 || balance_factor < -1) then rotate

2. Insertion Time Complexity
- Avg time complexity of insertions is O(log n)- each operation must traverse from the root of the tree to a leaf, also depths differ by 1 at most
- Tree balances after every insertion which ensure time complexity remains efficient

3. Existence Time Complexity
- Avg time complexity of checking existence is O(log n)- operation of following a path from the root down to a leaf
- Self-balancing property ofg AVL trees ensures that the tree's depth is always approx log n 

4. Handling Duplicates?
- Unnecessary space/storage of the same value stored multiple times
- Checking the existence of an element in the tree means that duplicates don't provide any extra useful information
- Could potentially slow down search process, inserts, and delete operations since the tree would be made larger than necessary
- To keep track of duplicates, a counter within the node class (structure) could be added, that way rather than adding another node the counter can be incremented instead

5. Design Considerations
- Works well with strings due to built-in functionality of string comparison using <, >, and == (no special consideration required for this)
- AVL tree would work well with integers since they have similar comparison methods
- Objects that have these comparison methods can be used for this tree

6. More Complex Objects?
- Defining Comparable Interface: Tree would nbe able to use methods to accurately allocate objects (==, <, >, <=, >=)
- Complex object class would include Comparable and define the <==> operator
- Complex objects could be used in the AVL tree if they adhere to the interface

7. Testing? 
- Decided to create these tests based on needing to verify expected AVL tree behaviour
- "it rejects duplicate elements" ensures that duplicate elements are not being added to the AVL tree, as per assignment specifications
- "it balances when inserting in descending/ascending order" ensures that AVL balancing functionality is working as expected (creating worst-case scenarios to determine if balance will happen correctly)

8. Most Challenging Aspects
- Augmenting rotation logic: Important implementation step, can become complex due to test cases/scenarios that need to be accounted for
- Adding unit tests: Ensuring that all important cases are covered, important to verify the implementation
- Balancing: Keeping track of balance factors and when to apply particular rotations