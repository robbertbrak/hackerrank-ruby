def insertion_sort(ar)
  i = 1
  while i < ar.length
    if ar[i] < ar[i - 1]
      value = ar[i]
      j = i - 1
      while j >= 0 && value < ar[j]
        ar[j+1] = ar[j]
        j -= 1
      end
      ar[j+1] = value
    end
    i += 1
  end
  puts ar.join(' ')
end

cnt = gets.to_i
insertion_sort(gets.chomp.split(' ').map(&:to_i))
