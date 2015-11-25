def quicksort(numbers, lo, hi)
  return unless lo < hi
  pivot = numbers[hi]
  idx = lo
  (lo..hi-1).each do |i|
    if numbers[i] < pivot
      numbers[idx], numbers[i] = numbers[i], numbers[idx]
      idx += 1
    end
  end
  numbers[hi], numbers[idx] = numbers[idx], numbers[hi]
  puts numbers.join(' ')
  quicksort(numbers, lo, idx - 1)
  quicksort(numbers, idx + 1, hi)
end

gets
numbers = gets.chomp.split.map(&:to_i)
quicksort(numbers, 0, numbers.length - 1)
