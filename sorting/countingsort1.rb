n = gets.to_i
nums = gets.split.map(&:to_i)
counts = Array.new(size = 100, default = 0)

nums.each do |num|
  counts[num] += 1
end

puts counts.join(' ')
