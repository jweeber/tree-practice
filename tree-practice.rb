class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

# def print_infix(node)
#   return if node == nil
#   print_infix(node.left)
#   print node.value + " "
#   print_infix(node.right)
# end

def operators(node)
  return if node == nil
  if node.value.match(/\+|\-|\/|\%|\*/)
    print node.value
  end
end

root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
operators(root)

puts "\n\n"

second = TreeNode.new("-")
second.right = TreeNode.new("10")
second.left = TreeNode.new("+")
second.left.right = TreeNode.new("2")
second.left.left = TreeNode.new("3")
operators(second)

puts "\n"

third = TreeNode.new("+")
third.right = TreeNode.new("2")
third.left = TreeNode.new("*")
third.left.right = TreeNode.new("3")
third.left.left = TreeNode.new("4")
operators(third)

puts "\n"
