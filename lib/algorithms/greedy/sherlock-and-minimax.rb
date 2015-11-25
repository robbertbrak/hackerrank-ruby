def min(a, b)
  a < b ? a : b
end

def avg(a, b)
  (a + b) / 2.0
end

def find_min(average, a, b, min, min_index)
  # puts "avg: #{average}"
  if average.floor - a > min
    min = average.floor - a
    min_index = average.floor
    # puts "floor: #{average.floor} #{min} #{min_index}"
  elsif b - average.ceil > min
    min = b - average.ceil
    min_index = average.ceil
    # puts "ceil: #{average.ceil} #{min} #{min_index}"
  end
  return min, min_index
end

def find_max_min
  gets.to_i
  nums = gets.split.map(&:to_i).sort
  p, q = gets.split.map(&:to_i)

  left = nums.index(nums.bsearch { |x| x >= p }) || nums.length
  right = (nums.index(nums.bsearch { |x| x > q }) || nums.length) - 1

  # left = the index of the smallest number larger than p
  # right = the index of the largest number smaller than q

  min = -1
  min_index = -1

  # Special cases:
  # right = -1 means q is smaller than any number.
  #   In this case we can just print p, because it will maximize the distance to the numbers.
  if right == -1
    puts p
    return
  end

  # left = nums.length means p is larger than any number.
  #   In this case we can just print q.
  if left == nums.length
    puts q
    return
  end

  # Special case: right < left means that the range is in between two numbers.
  if right < left
    right = left
  end

  # Otherwise, there is at least one number between p and q, where nums[left] is the smallest and nums[right] is the largest.

  #p nums
  #puts "left/right #{left} #{right}"

  # Check the left edge first
  if p <= nums[left]
    if left > 0
      average = avg(nums[left-1], nums[left])
      if p < average
        min, min_index = find_min(average, nums[left-1], nums[left], min, min_index)
      else
        min = nums[left] - p
        min_index = p
      end
    else
      min = nums[left] - p
      min_index = p
    end
    # puts "p: #{min} #{min_index}"
  end

  # Check the middle range
  (left+1..right).each do |i|
    average = avg(nums[i], nums[i-1])
    min, min_index = find_min(average, nums[i-1], nums[i], min, min_index)
  end

  # Finally check the right edge
  if q > nums[right]
    if right < nums.length - 1
      average = avg(nums[right], nums[right+1])
      if q > average
        min, min_index = find_min(average, nums[right], nums[right+1], min, min_index)
      else
        if q - nums[right] > min
          min = q - nums[right]
          min_index = q
        end
      end
    else
      if q - nums[right] > min
        min = q - nums[right]
        min_index = q
      end
    end
    # puts "q: #{min} #{min_index}"
  end

  # puts min
  puts min_index
end

find_max_min