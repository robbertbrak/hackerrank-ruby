require 'set'

n, m = gets.split.map &:to_i
coins = gets.split.map &:to_i

solutions = Array.new(n)

def solve(n, solutions, coins)
  return Set.new if n < 0
  return solutions[n] unless solutions[n].nil?

  solutions[n] = Set.new

  if n == 0
    solutions[n].add(Hash.new)
    return solutions[n]
  end

  coins.each do |coin|
    smaller_solutions = solve(n - coin, solutions, coins)
    smaller_solutions.each do |solution|
      solution = solution.clone
      solution[coin] = (solution[coin] || 0) + 1
      solutions[n].add(solution)
    end
  end

  p solutions[n]
  solutions[n]
end

final_solutions = solve(n, solutions, coins)
puts final_solutions.length
