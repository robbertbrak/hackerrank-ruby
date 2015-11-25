# The objective is to select elements from the array `nums` (where each element can be chosen multiple times)
# for which the sum is as near as possible to the number `k`.
# Let the elements in the solution set be ordered the same as those in `nums`.
# Let solution(j, i) be the optimal solution for the number `j` when only considering elements in `nums` up to the `i`th element.
# Then the *last* element of solution(j, i) is either nums[i], or it isn't, in which case nums[i] is not in the optimal solution.
# If it is the former, then solution(j, i) is solution(j - nums[i], i) + nums[i].
# If it is the latter, then solution(j, i) is solution(j, i - 1).
# By taking the maximum, we know which one is right.
# The solution we're looking for is solution(k, n).

class Solver
  def initialize(nums, k)
    @nums = nums
    @solutions = Array.new(nums.length)
    (nums.length).times { |n| @solutions[n] = Array.new(k+1) }
    @solutions[0][0] = 0
  end

  def max(a, b)
    a > b ? a : b
  end

  def solution(j, i)
    return @solutions[i][j] if @solutions[i][j]
    if j - @nums[i] >= 0 && i > 0
      @solutions[i][j] = max(solution(j - @nums[i], i) + @nums[i], solution(j, i - 1))
    elsif j - @nums[i] >= 0
      @solutions[i][j] = solution(j - @nums[i], i) + @nums[i]
    elsif i > 0
      @solutions[i][j] = solution(j, i - 1)
    else
      @solutions[i][j] = 0
    end
    @solutions[i][j]
  end
end

t = gets.to_i
t.times do
  n, k = gets.split.map(&:to_i)
  nums = gets.split.map(&:to_i)
  puts Solver.new(nums, k).solution(k, n-1)
end
