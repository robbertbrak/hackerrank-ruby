n, t = gets.strip.split.map(&:to_i)
segments = gets.strip.split.map(&:to_i)
t.times do
  i, j = gets.strip.split.map(&:to_i)
  puts segments[i..j].min
end
