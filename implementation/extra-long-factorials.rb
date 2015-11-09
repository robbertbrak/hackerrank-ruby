n = gets.to_i

factorial = 1
n.times do |i|
  factorial *= i+1
end
puts factorial
