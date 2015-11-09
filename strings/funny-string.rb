num_cases = gets.to_i

num_cases.times do |i|
  str = gets.strip
  arr = str.bytes.each_cons(2).map { |a| (a[0] - a[1]).abs }
  puts (if arr == arr.reverse then 'Funny' else 'Not Funny' end)
end