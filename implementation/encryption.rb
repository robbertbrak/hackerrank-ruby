message = gets.strip.gsub(/ /, '')
msg_length = message.length
rows = Math.sqrt(msg_length).floor
columns = Math.sqrt(msg_length).ceil
rows += 1 if rows * columns < msg_length
columns.times do |c|
  rows.times do |r|
    idx = c + columns * r
    putc message[idx] if idx < msg_length
  end
  putc ' '
end
puts
