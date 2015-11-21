# Easiest solution:
# n = gets.to_i
# nums = gets.split.map(&:to_i)
# nums.sort!
#
# puts nums[(n / 2.0).floor]

def quickselect(numbers, lo, hi, index)
  return numbers[lo] unless lo < hi
  pivotIndex = Random.new.rand(lo..hi)
  pivot = numbers[pivotIndex]
  numbers[pivotIndex], numbers[hi] = numbers[hi], numbers[pivotIndex]
  idx = lo
  (lo..hi-1).each do |i|
    if numbers[i] < pivot
      numbers[idx], numbers[i] = numbers[i], numbers[idx]
      idx += 1
    end
  end
  numbers[hi], numbers[idx] = numbers[idx], numbers[hi]
  if idx == index
    return numbers[idx]
  elsif idx < index
    return quickselect(numbers, idx + 1, hi, index)
  else
    return quickselect(numbers, lo, idx - 1, index)
  end
end

n = gets.to_i
numbers = gets.split.map(&:to_i)
puts quickselect(numbers, 0, numbers.length - 1, (n / 2.0).floor)
