# frozen_string_literal: true

puts 'Hangman initialized'

lines = File.readlines('words.txt')

class Game
  def initialize(lines)
    @lines = lines
    @guesses = []
    @word_list = []
    @word = ''
    @letters = 'qwertzuiopasdfghjklyxcvbnm'
    @lives = 5
  end

  def get_word_list
    @lines.each do |line|
      @word_list.push(line) if line.length > 5 && line.length < 12
    end
  end

  def generate_random_word
    @word = @word_list[rand(@word_list.length)]
  end

  def play_round(guess)
    if @word.include?(guess)
      puts "The word includes #{guess}"
    else
      @lives -= 1
    end
    @guesses.push(guess)
  end

  def return_lives
    @lives
  end

  def display_word
    current_word = @word.split("")
    current_word.pop()
    current_word.each do |letter|
      if @guesses.include?(letter)
        print letter
      else
        print ' _ '
      end
    end
    if (current_word - @guesses).empty?
        puts "You win"
        @lives = 0
    end
  end
end

game = Game.new(lines)
game.get_word_list
game.generate_random_word
game.display_word

while !game.return_lives.zero?
  puts 'please enter a letter'
  guess = gets.chomp
  while guess.length > 1
    puts 'please enter a letter'
    guess.gets.chomp
  end
  game.play_round(guess)
  game.display_word
end
