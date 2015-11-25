t = gets.to_i
t.times do
  n = gets.to_i
  sum = 0
  gets.split.each do |num|
    sum |= num.to_i
  end
  sum <<= (n-1)
  puts sum % 1000000007
end
