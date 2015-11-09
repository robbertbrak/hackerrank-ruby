# TODO: Ergens zit nog een fout...

def pick_first_string(str1, str2, chr, i, j)
  while i < str1.length && j < str2.length && str1[i] == str2[j] && str1[i] <= str1[i-1] do
    putc str1[i]
    i += 1
    j += 1
  end
  if i == str1.length && j == str2.length
    return true, i, j
  elsif i == str1.length
    return false, i, j
  elsif j == str2.length
    return true, i, j
  else
    return str1[i] < str2[j], i, j
  end
end

cases = gets.to_i
cases.times do
  str1 = gets.strip.bytes
  str2 = gets.strip.bytes
  i = j = 0
  while i < str1.length && j < str2.length do
    if str1[i] == str2[j]
      putc str1[i]
      lookahead = pick_first_string(str1, str2, str1[i], i+1, j+1)
      if lookahead[0]
        i = lookahead[1]
      else
        j = lookahead[2]
      end
    elsif str1[i] < str2[j]
      putc str1[i]
      i += 1
    else
      putc str2[j]
      j += 1
    end
  end

  # One of the strings could have some remaining characters in it. Print them.
  while i < str1.length do
    putc str1[i]
    i += 1
  end
  while j < str2.length do
    putc str2[j]
    j += 1
  end
  puts
end