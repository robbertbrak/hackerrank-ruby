def max(a, b)
  a > b ? a : b
end

def max_subarray(nums)
  max_ending_here = nums[0]
  max_so_far = max_ending_here
  nums.drop(1).each do |n|
    max_ending_here = max(n, max_ending_here + n)
    max_so_far = max(max_so_far, max_ending_here)
  end
  max_so_far
end

def max_non_contiguous(nums)
  positive, negative = nums.partition { |n| n >= 0 }
  if positive.length == 0
    negative.max
  else
    positive.reduce(:+)
  end
end

t = gets.to_i
t.times do
  n = gets.to_i
  nums = gets.split.map(&:to_i)
  print max_subarray(nums)
  print ' '
  puts max_non_contiguous(nums)
end
