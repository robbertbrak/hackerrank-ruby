n, k = gets.strip.split.map(&:to_i)
costs = gets.strip.split.map(&:to_i).sort.reverse
sum = 0

y = k
x = 1
n.times do |i|
  if y > 0
    y -= 1
  else
    y = k - 1
    x += 1
  end
  sum += x * costs[i]
end

puts sum
