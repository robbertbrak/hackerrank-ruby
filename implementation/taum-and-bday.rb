count = gets.to_i
count.times do
  num_gifts = gets.strip.split.map(&:to_i)
  prices = gets.strip.split.map(&:to_i)

  black_cost = [prices[0], prices[1] + prices[2]].min
  white_cost = [prices[1], prices[0] + prices[2]].min

  puts (black_cost * num_gifts[0] + white_cost * num_gifts[1])
end
