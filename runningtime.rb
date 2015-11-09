size = gets.to_i - 1
vals = gets.strip.split.map(&:to_i)

shifts = 0

(1..size).each do |idx|
  val = vals[idx]

  while idx > 0 && vals[idx - 1] > val do
    vals[idx] = vals[idx - 1]
    idx -= 1
    shifts += 1
  end

  vals[idx] = val
end

puts shifts
