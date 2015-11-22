# The idea is to go through the list of stock prices backwards.
# Initially the maximum on the last price.
# Whenever the price is lower than the maximum (backwards in time), we buy.
# When we reach a new maximum, we sell everything.
# For example, given the sequence 1 2 4 2 3, we get the following:
# BUY BUY SELL BUY SELL
# This results in a profit of 4-1 + 4-2 + 3-2 = 6
# If the sequence is 1 2 4 2 5, we get:
# BUY BUY BUY BUY SELL
# This results in a profit of 5-1 + 5-2 + 5-4 + 5-2 = 4+3+1+3 = 11

# In case a number is the same as the previous maximum, it doesn't matter whether we buy or sell,
# For example, if the sequence is 1 2 5 2 5, we get either:
# BUY BUY SELL BUY SELL
# or
# BUY BUY BUY BUY SELL
# Both result in a profit of 10.

t = gets.to_i
t.times do
  n = gets.to_i
  prices = gets.split.map(&:to_i).reverse
  max = 0
  profit = 0
  prices.each do |price|
    if price >= max
      max = price
    else
      profit += (max - price)
    end
  end
  puts profit
end
