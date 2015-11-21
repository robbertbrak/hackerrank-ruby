require 'set'

def max(a, b)
  a > b ? a : b
end

t = gets.to_i
t.times do
  n, m = gets.split.map(&:to_i)
  nums = gets.split.map(&:to_i)

  # Calculate prefix array
  prefix = Array.new(size = nums.length)
  sum = 0
  nums.each_with_index do |item, index|
    sum = (item % m + sum) % m
    prefix[index] = sum
  end

  max_sum = 0
  prefix_set = SortedSet.new
  prefix.each_with_index do |item, i|
    prefix_j = prefix_set.entries.bsearch { |x| x >= prefix[i] }
    if prefix_j
      max_sum = max(max_sum, (prefix[i] - prefix_j + m) % m)
    end

    max_sum = max(max_sum, prefix[i])
    prefix_set.add(prefix[i])
  end

  puts max_sum
end
