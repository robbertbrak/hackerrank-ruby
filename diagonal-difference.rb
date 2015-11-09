dim = gets.to_i
sum1 = sum2 = 0
dim.times do |i|
  row = gets.split.map(&:to_i)
  sum1 += row[i]
  sum2 += row[dim - i - 1]
end
puts (sum1 - sum2).abs