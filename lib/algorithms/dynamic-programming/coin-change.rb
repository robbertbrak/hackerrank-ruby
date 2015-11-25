require 'set'

n, m = gets.split.map &:to_i
coins = gets.split.map(&:to_i).sort

solutions = Array.new(m)

m.times do |i|
  solutions[i] = Array.new(n+1, 0)
  (n+1).times do |j|
    solutions[i][j] = 1 if i == 0 && j == 0
    solutions[i][j] += solutions[i-1][j] if i > 0
    solutions[i][j] += solutions[i][j - coins[i]] if j - coins[i] >= 0
    #puts "#{i} #{j} #{coins[i]}"
    #p solutions
  end
end

puts solutions[-1][-1]
