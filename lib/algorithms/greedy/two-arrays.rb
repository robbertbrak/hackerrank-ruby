t = gets.to_i
t.times do
  def has_pairs
    n, k = gets.split.map(&:to_i)
    a = gets.split.map(&:to_i).sort
    b = gets.split.map(&:to_i).sort.reverse
    n.times do |i|
      if a[i] + b[i] < k
        puts "NO"
        return
      end
    end
    puts "YES"
  end

  has_pairs
end
