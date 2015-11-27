l, s1, s2 = gets.split.map(&:to_i)
t = gets.to_i
l = Math.sqrt(2 * l*l)
t.times do
  q = gets.to_i
  q = Math.sqrt(2 * q)
  puts ((q - l) / (s1 - s2)).abs
end
