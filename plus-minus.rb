dim = gets.to_i
parts = gets.split.map(&:to_i).group_by { |i| i <=> 0 }
[1,-1,0].each { |i| puts sprintf('%.3f', (parts[i] || []).length.to_f / dim) }