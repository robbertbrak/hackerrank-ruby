# We can place either vertical (of width 1) or horizontal bars (of width 4).
# So, for each n, the number of solutions is the sum of:
# * the number of solutions for n - 1 (with an extra vertical bar)
# * the number of solutions for n - 4 (with an extra set of horizontal bars)
# For n <= 3, the number of solutions is 1.
#

require 'prime'

def generate_solutions(upper_bound)
  num_solutions = Array.new(upper_bound + 1)
  num_primes = Array.new(upper_bound + 1)

  (upper_bound+1).times do |i|
    if i <= 3
      num_solutions[i] = 1
    else
      num_solutions[i] = num_solutions[i - 1] + num_solutions[i - 4]
    end
    num_primes[i] = 0
    Prime.each(num_solutions[i]) { |p| num_primes[i] += 1 }
  end

  num_primes
end

primes = generate_solutions(40)

t = gets.to_i
t.times do
  n = gets.to_i
  puts primes[n]
end
