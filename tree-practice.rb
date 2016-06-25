class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def operators(node)
  return if node == nil
  if node.value.match(/\+|\-|\/|\%|\*/)
    print node.value
  end
end

puts "\nFirst expression:"
root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
print_infix(root)
puts "\nFirst expression operators:\n"
operators(root)

puts "\nSecond expression:"
second = TreeNode.new("-")
second.right = TreeNode.new("10")
second.left = TreeNode.new("+")
second.left.right = TreeNode.new("2")
second.left.left = TreeNode.new("3")
print_infix(second)
puts "\nSecond expression operators:\n"
operators(second)

puts "\nThird expression:"
third = TreeNode.new("+")
third.right = TreeNode.new("2")
third.left = TreeNode.new("*")
third.left.right = TreeNode.new("3")
third.left.left = TreeNode.new("4")
print_infix(third)
puts "\nThird expression operators:\n"
operators(third)

puts "\nFourth expression:"
fourth = TreeNode.new("-")
fourth.right = TreeNode.new("%")
fourth.right.right = TreeNode.new("5")
fourth.right.left = TreeNode.new("10")
fourth.left = TreeNode.new("2")
fourth.left.right = TreeNode.new("+")
fourth.left.right.right = TreeNode.new("*")
fourth.left.right.right.right = TreeNode.new("3")
fourth.left.right.right.left = TreeNode.new("4")
print_infix(fourth)
puts "\nFourth expression operators:\n"
operators(fourth) 
print "\n"


# PSEUDOCODE

# 1. Let's write a method that prints out all the operators that exist in the tree. 

# Current operators method passes in the first node in the tree and will print out
# the node operator if it matches operation in the given pattern. We would need to call
# this method on each node to get it to print out currently, but we could model the
# print_infix method and call the operator method inside of itself twice, passing in 
# node.left and node.right, and then checking the pattern matching that's defined against both
# something like:

# def operators(node)
#   return if node == nil
#   operators(node.left)
#   if node.value.match(/\+|\-|\/|\%|\*/)
#     print node.value + " "
#   end
#   operators(node.right)
# end

# 2. Write a method that returns the count of non-operators (in this case, leaves) in the tree.

# This could be written like the operator method, but with the pattern matching conditional checking for
# any digit instead of anything matching the operator. The method would call itself within it, passing in 
# node.left and node-right to check each node for the pattern.
# something like:

# def non_operators(node)
#   return if node == nil
#   non_operators(node.left)
  # if node.value.match(/regex pattern for matching digits/)
#     print node.value + " "
#   end
#   non_operators(node.right)
# end

# 3. Write methods to print the tree in prefix and postfix notations.

# Prefix
# Prefix notation is when the operator comes before the number(s) that will be evaluated with
# that operation. I drew out a tree using one of the examples above, tracking the pattern of the infix method.
# Infix: 4 * 3 + 2 (recursively check left, print node, check right)
# Prefix: + * 4 3 2 (recursively print node, check left, check right)
# something like:

# def print_prefix(node)
#   return if node == nil
#   print node.value + " "
#   print_infix(node.left)
#   print_infix(node.right)
# end 

# Postfix
# Postfix notation is when the operators comes after the number(s) that will be evaluated
# Infix: 4 * 3 + 2 (recursively check left, print node, check right)
# Postfix: 4 3 * 2 + (recusively check left, check right, print node)
# something like:

# def print_postfix(node)
#   return if node == nil
#   print_infix(node.left)
#   print_infix(node.right)
#   print node.value + " "
# end 

# 4. Write a method that returns whether or not a given operator exists in the tree.
# I think we can reuse some of the operators method and pass in the node and the
# given operand, checking with regex pattern matching to see if any of the nodes we check
# are the operand given. Not sure if we need the first line or where to return false.

# def operator?(node, operand)
#   return if node == nil => ?
#   operator?(node.left, operand)
#   if node.value.match(/operand/)
#     return true
#   end
#   operator?(node.right, operand)
# end

# 5. Evaluate an infix binary tree.


# TDD

first_tree = TreeNode.new("-")
first_tree.right = TreeNode.new("2")
first_tree.left = TreeNode.new("/")
first_tree.left.right = TreeNode.new("2")
first_tree.left.left = TreeNode.new("10")

puts "First Tree Test:\n"
operators(first_tree)
non_operators(first_tree)
operator?(first_tree, "-")
operator(first_tree, "+")
print_prefix(first_tree)
print_postfix(first_tree)


second_tree = TreeNode.new("+")
second_tree.right = TreeNode.new("4")
second_tree.left = TreeNode.new("-")
second_tree.left.right = TreeNode.new("1")
second_tree.left.left = TreeNode.new("8")

puts "\nSecond Tree Test:\n"
operators(second_tree)
non_operators(second_tree)
operator?(second_tree, "+")
operator(second_tree, "%")
print_prefix(second_tree)
print_postfix(second_tree)

third_tree = TreeNode.new("-")
third_tree.right = TreeNode.new("%")
third_tree.right.right = TreeNode.new("5")
third_tree.right.left = TreeNode.new("10")
third_tree.left = TreeNode.new("4")
third_tree.left.right = TreeNode.new("-")
third_tree.left.right.right = TreeNode.new("*")
third_tree.left.right.right.right = TreeNode.new("10")
third_tree.left.right.right.left = TreeNode.new("2")

puts "\nThird Tree Test:\n"
operators(third_tree)
non_operators(third_tree)
operator?(third_tree, "%")
operator(third_tree, "/")
print_prefix(third_tree)
print_postfix(third_tree)

puts "\n\n"


