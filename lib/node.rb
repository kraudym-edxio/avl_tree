class Node
  attr_accessor :value, :left, :right, :height

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
    @height = 1
  end
end
