a, b, n = gets.split.map(&:to_i)
(n - 2).times do
  c = b*b + a
  a = b
  b = c
end
puts b
