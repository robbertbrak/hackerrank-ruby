actual_day, actual_month, actual_year = gets.strip.split.map(&:to_i)
expected_day, expected_month, expected_year = gets.strip.split.map(&:to_i)

if actual_year > expected_year
  puts 10000
elsif actual_year == expected_year && actual_month > expected_month
  puts 500 * (actual_month - expected_month)
elsif actual_year == expected_year && actual_month == expected_month && actual_day > expected_day
  puts 15 * (actual_day - expected_day)
else
  puts 0
end
