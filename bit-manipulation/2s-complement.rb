def ones(b)
  bits = b.to_s(2)
  i = bits.length
  num_ones = 0
  sum = 0
  bits.chars.each_with_index do |bit, index|
    i -= 1
    if bit == '1'
      sum += i * (1 << i-1) + num_ones * (1 << i)
      num_ones += 1
    end
  end
  sum += num_ones
  sum
end

t = gets.to_i
t.times do
  a, b = gets.split.map &:to_i
  # Divide the range a..b in negative and non-negative numbers.
  # Determine the sum of ones for each range separately and sum the results at the end.

  if a == 0
    puts ones(b)
  elsif a > 0
    puts ones(b) - ones(a - 1)
  elsif b >= 0
    # a is negative, but b is not.
    a = a.abs
    puts ones(b) + 32 * a - ones(a - 1)
  else
    # both a and b are negative
    b = b.abs - 1
    a = a.abs

    if b > 0
      puts 32 * a - ones(a - 1) - (32 * b - ones(b - 1))
    else
      puts 32 * a - ones(a - 1)
    end
  end
end
