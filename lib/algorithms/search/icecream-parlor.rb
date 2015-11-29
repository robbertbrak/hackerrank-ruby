t = gets.to_i
t.times do
  m = gets.to_i
  n = gets.to_i
  cs = gets.split.map(&:to_i)
  indexed = Hash.new
  cs.length.times do |i|
    indexed[cs[i]] = (indexed[cs[i]] || Array.new).push i + 1
  end
  cs.length.times do |i|
    rest = m - cs[i]
    if rest != cs[i] and indexed.member? rest
      puts "#{indexed[cs[i]][0]} #{indexed[rest][0]}"
      break
    elsif rest == cs[i] and indexed[rest].length == 2
      puts "#{indexed[cs[i]][0]} #{indexed[rest][1]}"
      break
    end
  end
end
