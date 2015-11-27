str = gets.chomp

frequencies = Hash.new()
str.each_char do |c|
  frequencies[c] = (frequencies[c] || 0) + 1
end
groups = frequencies.values.group_by { |freq| freq }

if groups.length > 2
  # Als er meer dan 2 frequentiegroepen zijn, is het sowieso niet mogelijk om tot 1 frequentiegroep te komen
  # door slechts 1 letter te verwijderen.
  puts 'NO'
elsif groups.length < 2
  # Alle letters hebben dezelfde frequentie.
  puts 'YES'
else
  # Er zijn precies 2 frequentiegroepen. Dit is de meest interessante groep.
  # In de volgende situaties is het mogelijk om een oplossing te bereiken:
  # 1) in 1 van de frequentiegroepen zit slechts 1 letter.
  # 2) de frequenties zijn sequentieel (bijvoorbeeld 5 en 6), waarbij slechts 1 letter de grootste frequentie heeft.
  largest_key = groups.keys.sort[1]
  smallest_key = groups.keys.sort[0]

  if groups.has_key? 1 and groups[1].length == 1
    puts 'YES'
  elsif largest_key - smallest_key == 1 and groups[largest_key].length == 1
    puts 'YES'
  else
    puts 'NO'
  end
end
