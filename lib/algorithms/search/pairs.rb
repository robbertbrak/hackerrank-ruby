require 'set'
# Eigenschap: alle getallen zijn uniek.

n, k = gets.chomp.split.map(&:to_i)
nums = Set.new(gets.chomp.split.map(&:to_i))

num_pairs = 0

nums.each do |num|
  if nums.member? num + k
    num_pairs += 1
  end
end

puts num_pairs
