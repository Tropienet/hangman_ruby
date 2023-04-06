puts "Hangman initialized"

lines = File.readlines("words.txt")

letters = "qwertzuiopasdfghjklyxcvbnm"

class Game 
    def initialize(lines)
        @lines = lines
        @lives = 5;
        @guesses = []
        @word_list = []
        @word = ""
        @letters = "qwertzuiopasdfghjklyxcvbnm"
    end

    def get_word_list 
        @lines.each do |line|
            if line.length > 5 && line.length < 12
                @word_list.push(line)
            end
        end
    end

    def generate_random_word
        @word = @word_list[rand(@word_list.length)]
    end

    def play_round(guess)
        if @word.include?(guess) 
            puts "The word includes #{guess}"
        end
    end
end

game = Game.new(lines)
game.get_word_list
game.generate_random_word
game.play_round(gets.chomp)


word_list = []
lives = 5

lines.each do |line|
    if line.length > 5 && line.length < 12
       word_list.push(line)
    end
end

word = word_list[rand(word_list.length)]
guesses = []
current_word = word

while lives > 0 do
    alreadyTried = true

    def getGuess 
        puts "Please enter 1 letter"
        return gets.chomp
    end

    guess = getGuess()

    while alreadyTried do
        if guesses.include?(guess)
            if lives > 0
                lives -= 1
                puts "You already tried this letter, current lives #{lives}"
                guess = getGuess()
            end
        elsif
            alreadyTried = false
        end
    end
    while guess.length > 1 do 
        guess = getGuess
    end 

    if word.include?(guess)
        letters = letters.gsub(guess, "_")
        puts letters
        puts "This is the word #{current_word.gsub(letters, "_")}"
        guesses.push(guess)
        p "Already tried #{guesses.join(",")}"
    elsif
        lives -=1
        puts "Remaining lives #{lives}"
        guesses.push(guess)
        p "Already tried #{guesses.join(",")}"
    end

    
end