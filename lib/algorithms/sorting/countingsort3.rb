n = gets.to_i

counts = Array.new(size = 100, default = 0)

n.times do
  x, str = gets.strip.split
  counts[x.to_i] += 1
end

sum = 0
counts.each_with_index do |count, index|
  sum += count
  counts[index] = sum
end

puts counts.join(' ')
