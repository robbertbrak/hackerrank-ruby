# TODO: Ergens zit nog een fout...

class MorganString
  def pick_first_string(str1, str2, chr, i, j)
    finalI, finalJ = i, j
    while i < str1.length && j < str2.length && str1[i] == str2[j] do
      if str1[i] <= chr
        putc str1[i]
        chr = str1[i]
        finalI = i
        finalJ = j
      end
      i += 1
      j += 1
    end

    #puts "#{i} #{j} #{str1[i]} #{str2[j]}"
    if i == str1.length && j == str2.length
      return true, finalI
    elsif i == str1.length
      return str1[i-1] < str2[j] ? [true, finalI] : [false, finalJ]
    elsif j == str2.length
      return str2[j-1] < str1[i] ? [false, finalJ] : [true, finalI]
    else
      return str1[i] < str2[j] ? [true, finalI] : [false, finalJ]
    end
  end

  def find_minimal_string(str1, str2)
    i = j = 0
    while i < str1.length && j < str2.length do
      if str1[i] == str2[j]
        lookahead = pick_first_string(str1, str2, str1[i], i, j)
        if lookahead[0]
          i = lookahead[1] + 1
        else
          j = lookahead[1] + 1
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

  def run
    cases = gets.to_i
    cases.times do
      str1 = gets.strip.chars
      str2 = gets.strip.chars
      morgan_string.find_minimal_string str1, str2
    end
  end
end

# MorganString.new.run

