height = gets.to_i
height.times do |i|
  (height - i - 1).times { |j| print ' ' }
  (i+1).times { |j| print '#' }
  puts
end