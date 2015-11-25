# Ignore the first line
gets

sticks = gets.strip.split.map(&:to_i).sort

while sticks.length > 0 do
  puts sticks.length
  sticks = sticks.map { |i| i - sticks[0] }
  idx = sticks.find_index { |i| i > 0 } || sticks.length
  sticks = sticks[idx..-1]
end
