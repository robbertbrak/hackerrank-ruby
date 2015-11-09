def is_cavity(map, val, r, c)
  r > 0 && c > 0 &&
      r < map.length-1 && c < map.length-1 &&
      map[r-1][c] < val && map[r][c-1] < val && map[r+1][c] < val && map[r][c+1] < val
end

dimensions = gets.to_i
map = Array.new dimensions
dimensions.times do |i|
  map[i] = gets.strip
end

map.length.times do |r|
  map.length.times do |c|
    val = map[r][c]
    if is_cavity(map, val, r, c)
      putc 'X'
    else
      putc val
    end
  end
  puts
end