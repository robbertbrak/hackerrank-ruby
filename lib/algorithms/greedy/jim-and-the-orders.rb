n = gets.to_i
delivery_times = Hash.new
n.times do |i|
  t, d = gets.split.map(&:to_i)
  delivery_times[t+d] = (delivery_times[t+d] || []) << (i + 1)
end

results = Array.new
delivery_times.keys.sort.each do |k|
  results.concat(delivery_times[k])
end

puts results.join(' ')
