def find_index(str)
  last = str.length - 1
  str.chars.each_with_index do |c, i|
    if str[i] != str[last - i]
      # Verschil gevonden. Kijk welk van de twee letters weggehaald kan worden.
      pal1 = (str[0,i] || '') + str[i+1..-1]
      if (pal1 == pal1.reverse)
        return i
      else
        return last - i
      end
    end
  end
  return -1
end

count = gets.to_i
count.times do
  puts find_index gets.strip
end