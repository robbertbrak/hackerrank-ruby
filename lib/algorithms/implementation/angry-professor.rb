count = gets.to_i
count.times do
  n, k = gets.strip.split.map(&:to_i)
  arrival_times = gets.strip.split.map(&:to_i).group_by { |i| i <= 0 }
  if (arrival_times[true] || []).length >= k
    puts 'NO'
  else
    puts 'YES'
  end
end
