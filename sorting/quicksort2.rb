def quicksort(numbers)
  return numbers unless numbers.length > 1
  pivot = numbers[0]
  partitions = numbers[1..-1].group_by { |i| i < pivot }
  result = quicksort(partitions[true] || []) + [pivot] + quicksort(partitions[false] || [])
  puts result.join(' ')
  return result
end

gets
numbers = gets.chomp.split.map(&:to_i)
quicksort(numbers)