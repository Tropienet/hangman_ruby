puts "Hangman initialized"

lines = File.readlines("words.txt")


word_list = []

lines.each do |line|
    if line.length > 5 && line.length < 12
       word_list.push(line)
    end
end

word = word_list[rand(word_list.length)]

puts word