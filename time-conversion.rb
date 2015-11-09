/(\d\d):(\d\d):(\d\d)(AM|PM)/ =~ gets
if $4 == 'AM'
  puts "#{sprintf('%02d', ($1.to_i % 12))}:#$2:#$3"
else
  puts "#{($1.to_i % 12) + 12}:#$2:#$3"
end