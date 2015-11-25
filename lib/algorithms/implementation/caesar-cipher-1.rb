gets
n = gets
k = gets.to_i

def rotate(c, ref, k)
  ((c.ord - ref.ord + k) % 26 + ref.ord).chr
end

n.chars.each_with_index do |c, idx|
  if c >= 'a' && c <= 'z'
    n[idx] = rotate(c, 'a', k)
  elsif c >= 'A' && c <= 'Z'
    n[idx] = rotate(c, 'A', k)
  end
end
puts n
