require_relative 'card'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'round'
require_relative 'game'

def start_game
  puts "Добро пожаловать в игру Blackjack!"

  begin
    game = Game.new
    game.start
  rescue StandardError => e
    puts "Произошла ошибка: #{e.message}"
    puts "Попробуйте начать игру снова."
    retry
  end
end


start_game
