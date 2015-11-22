n = gets.to_i

sum = 0
previous_rating = 0
num_previous_higher_ratings = 0
previously_allocated_candies = 0
max_allocated_candies = 0

n.times do
  rating = gets.to_i
  if rating > previous_rating
    previously_allocated_candies += 1
    max_allocated_candies = previously_allocated_candies
    sum += previously_allocated_candies
    num_previous_higher_ratings = 0
  elsif rating == previous_rating
    previously_allocated_candies = 1
    max_allocated_candies = previously_allocated_candies
    sum += previously_allocated_candies
    num_previous_higher_ratings = 0
  else
    num_previous_higher_ratings += 1
    previously_allocated_candies = 1
    if num_previous_higher_ratings == max_allocated_candies
      max_allocated_candies += 1
      sum += max_allocated_candies
    else
      sum += num_previous_higher_ratings
    end
  end
  # puts "rating: #{rating} candies: #{previously_allocated_candies} max: #{max_allocated_candies} previous higher ratings: #{num_previous_higher_ratings} sum: #{sum}"
  previous_rating = rating
end

puts sum