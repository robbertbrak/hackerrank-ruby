idx = gets.to_i - 1
vals = gets.strip.split.map(&:to_i)
val = vals[idx]

while idx > 0 && vals[idx - 1] > val do
  vals[idx] = vals[idx - 1]
  puts vals.join(' ')
  idx -= 1
end

vals[idx] = val
puts vals.join(' ')