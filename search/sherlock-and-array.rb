t = gets.to_i
t.times do
  def has_equal_sum
    n = gets.to_i
    a = gets.split.map(&:to_i)
    sum_right = a.reduce(:+)
    sum_left = 0
    a.length.times do |i|
      sum_right -= a[i]
      if i > 0
        sum_left += a[i-1]
      end
      if sum_left == sum_right
        puts 'YES'
        return
      end
    end
    puts 'NO'
    return
  end

  has_equal_sum
end