num_letters = gets.strip.downcase.gsub(/ /, '').bytes.group_by { |i| i }.length
puts (if num_letters == 26 then 'pangram' else 'not pangram' end)