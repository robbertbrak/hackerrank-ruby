n, k = gets.split.map(&:to_i)
prices = gets.split.map(&:to_i).sort

spent = 0
i = 0
while spent + prices[i] < k
  spent += prices[i]
  i += 1
end

puts i
