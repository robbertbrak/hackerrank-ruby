def quicksort(numbers, lo, hi, swaps)
  return swaps unless lo < hi
  pivot = numbers[hi]
  idx = lo
  (lo..hi-1).each do |i|
    if numbers[i] < pivot
      swaps += 1
      numbers[idx], numbers[i] = numbers[i], numbers[idx]
      idx += 1
    end
  end
  numbers[hi], numbers[idx] = numbers[idx], numbers[hi]
  swaps += 1
  swaps = quicksort(numbers, lo, idx - 1, swaps)
  swaps = quicksort(numbers, idx + 1, hi, swaps)
  swaps
end

def insertionsort(vals)
  shifts = 0
  (1..vals.length-1).each do |idx|
    val = vals[idx]

    while idx > 0 && vals[idx - 1] > val do
      shifts += 1
      vals[idx] = vals[idx - 1]
      idx -= 1
    end

    vals[idx] = val
  end
  shifts
end

gets
numbers = gets.chomp.split.map(&:to_i)
swaps = quicksort(numbers.clone, 0, numbers.length - 1, 0)
shifts = insertionsort(numbers)
puts shifts - swaps
