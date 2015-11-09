count = gets.to_i
count.times do
  str1 = gets.strip
  str2 = gets.strip
  ary = Array.new 26
  26.times do |i|
    ary[i] = [false, false]
  end
  str1.each_byte do |b|
    ary['z'.ord - b][0] = true
  end
  str2.each_byte do |b|
    ary['z'.ord - b][1] = true
  end
  puts (if ary.any? { |i| i[0] && i[1] }
          'YES' else 'NO' end)
end