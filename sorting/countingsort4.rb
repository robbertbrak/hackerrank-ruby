n = gets.to_i

counts = Hash.new

n.times do |i|
  x, str = gets.strip.split
  counts[x.to_i] = (counts[x.to_i] || []) << (i < n / 2 ? '-' : str)
end

puts counts.keys.sort.map { |k| counts[k] }.flatten.join ' '
