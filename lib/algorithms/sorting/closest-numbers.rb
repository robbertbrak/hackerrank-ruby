n = gets.to_i
nums = gets.split.map(&:to_i).sort

min_diff = nums[1] - nums[0]
pairs = ''

nums.each_cons(2) do |pair|
  diff = pair[1] - pair[0]
  if diff < min_diff
    min_diff = diff
    pairs = pair.join(' ')
  elsif diff == min_diff
    pairs += ' ' unless pairs.length == 0
    pairs += pair.join(' ')
  end
end

puts pairs