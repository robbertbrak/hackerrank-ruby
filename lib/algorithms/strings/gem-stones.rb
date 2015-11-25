count = gets.to_i
ary = Array.new(26)
26.times do |i|
  ary[i] = Array.new(count)
  count.times do |j|
    ary[i][j] = 0
  end
end
count.times do |j|
  rock = gets.strip
  rock.each_byte do |c|
    ary['z'.ord - c][j] = 1
  end
end

sum = 0
('a'.ord..'z'.ord).each do |c|
  numstones = ary['z'.ord - c].reduce(&:+)
  sum += 1 if numstones == count
end

puts sum
