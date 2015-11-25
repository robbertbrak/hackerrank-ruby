count = gets.to_i
count.times do
  # Zoek van rechts naar links tot je de letter P tegenkomt die kleiner is dan zijn rechterbuurman.
  # Zoek dan van links naar rechts tot je de minimale letter Q tegenkomt die groter is dan P.
  # Wissel Q en P om en sorteer alle letters vanaf de oorspronkelijke positie van P tot het einde van de string.
  str = gets.chomp
  p = str.length - 2
  while p >= 0
    break if str[p] < str[p+1]
    p -= 1
  end
  if p < 0
    puts 'no answer'
    next
  end

  j = p+1
  q = j
  while j < str.length
    q = j if str[j] < str[q] && str[j] > str[p]
    j += 1
  end
  str[p], str[q] = str[q], str[p]

  str[p+1..-1] = str[p+1..-1].reverse
  puts str
end
