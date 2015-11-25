count = gets.to_i

def has_match(matrix, searchmatrix, r, c)
  r2 = 0
  while r2 < searchmatrix.length do
    c2 = 0
    while c2 < searchmatrix[r2].length do
      return false if matrix[r + r2][c + c2] != searchmatrix[r2][c2]
      c2 += 1
    end
    r2 += 1
  end
  true
end

def scan(matrix, searchmatrix, dimensions, searchdimensions)
  (dimensions[0] + 1 - searchdimensions[0]).times do |r|
    (dimensions[1] + 1 - searchdimensions[1]).times do |c|
      return true if has_match(matrix, searchmatrix, r, c)
    end
  end
  false
end

count.times do
  # Read the problem data
  dimensions = gets.strip.split.map(&:to_i)
  matrix = Array.new(dimensions[0])
  dimensions[0].times do |i|
    matrix[i] = gets.strip
  end
  searchdimensions = gets.strip.split.map(&:to_i)
  searchmatrix = Array.new(searchdimensions[0])
  searchdimensions[0].times do |i|
    searchmatrix[i] = gets.strip
  end

  # Search through the matrix
  # The idea is to scan from top left to bottom right.
  # Whenever the current digit matches the one in the top left of the search matrix,
  # we'll check if we have found a match.
  if scan(matrix, searchmatrix, dimensions, searchdimensions)
    puts 'YES'
  else
    puts 'NO'
  end
end