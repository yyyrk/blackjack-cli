require_relative 'card'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'round'
require_relative 'game'

def start_game
  puts "Добро пожаловать в игру Blackjack!"

  game = Game.new
  game.start
end

start_game
