count = gets.to_i
count.times do
  str = gets.strip
  if str.length % 2 != 0
    puts -1
  else
    half = str.length/2
    grp1 = str[0, half].chars.group_by { |c| c }
    grp2 = str[half, half].chars.group_by { |c| c }
    sum = 0
    26.times do |a|
      letter = ('a'.ord + a).chr
      count1 = (grp1[letter] || []).length
      count2 = (grp2[letter] || []).length
      if (count2 > count1)
        sum += count2 - count1
      end
    end
    puts sum
  end
end