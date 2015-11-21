n = gets.to_i
nums = gets.split.map(&:to_i)
counts = Array.new(size = 100, default = 0)

nums.each do |num|
  counts[num] += 1
end

first = true
counts.each_with_index do |count, index|
  count.times do
    putc ' ' unless first
    first = false
    $stdout.write index
  end
end
puts
