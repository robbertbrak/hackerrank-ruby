hours = gets.to_i
minutes = gets.to_i

numbers_to_words = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    21 => 'twenty one',
    22 => 'twenty two',
    23 => 'twenty three',
    24 => 'twenty four',
    25 => 'twenty five',
    26 => 'twenty six',
    27 => 'twenty seven',
    28 => 'twenty eight',
    29 => 'twenty nine',
}

if minutes == 0
  puts "#{numbers_to_words[hours]} o' clock"
elsif minutes == 1
  puts "one minute past #{numbers_to_words[hours]}"
elsif minutes == 15
  puts "quarter past #{numbers_to_words[hours]}"
elsif minutes == 30
  puts "half past #{numbers_to_words[hours]}"
elsif minutes < 30
  puts "#{numbers_to_words[minutes]} minutes past #{numbers_to_words[hours]}"
elsif minutes > 30
  hours += 1
  minutes = 60 - minutes
  if minutes == 1
    puts "one minute to #{numbers_to_words[hours]}"
  elsif minutes == 15
    puts "quarter to #{numbers_to_words[hours]}"
  else
    puts "#{numbers_to_words[minutes]} minutes to #{numbers_to_words[hours]}"
  end
end