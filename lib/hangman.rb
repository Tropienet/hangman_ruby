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
      puts "Remaining lives #{@lives}"
    end
    @guesses.push(guess)
  end

  def return_lives
    @lives
  end

  def display_guesses
    remaining_letters = @letters.split('')
    remaining_letters.pop
    puts "Letters you already tried guessing \n"
    remaining_letters.each do |letter|
      if @guesses.include?(letter)
        print letter
      else
        print ' _ '
      end
    end
  end

  def display_word
    current_word = @word.split('')
    current_word.pop
    current_word.each do |letter|
      if @guesses.include?(letter)
        print letter
      else
        print ' _ '
      end
    end
    return unless (current_word - @guesses).empty?

    puts 'You win'
    @lives = 0
  end
end

game = Game.new(lines)
game.get_word_list
game.generate_random_word

until game.return_lives.zero?
  puts "\nEnter a letter"
  guess = gets.chomp
  while guess.length > 1
    puts "\nEnter a letter"
    guess.gets.chomp
  end
  game.play_round(guess)
  game.display_word
  puts "\n"
  game.display_guesses
  puts "\nYou lose" if game.return_lives.zero?
end
