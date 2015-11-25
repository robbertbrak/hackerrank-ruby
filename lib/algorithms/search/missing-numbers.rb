n = gets.to_i

counts = Hash.new
gets.split.each do |item|
  counts[item] = (counts[item] || 0) + 1
end

m = gets.to_i
counts2 = Hash.new
gets.split.each do |item|
  counts2[item] = (counts2[item] || 0) + 1
end

results = counts2.keys.select { |item| (counts[item] || 0) < counts2[item] }
puts results.sort.join(' ')
