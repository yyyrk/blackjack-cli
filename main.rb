player
dealer
deck
carf
round

class Player
  def initialize
    @cards = []
    @balance = 100
  end
  points
  make_move
end

class User < Player
  def make_move
    puts 1.

      case 1
    :take
  end
end

class Dealer < Player
  def make_move
    points > 17 ? :take : :skip
  end
end

class Deck
  def take_card
    Card.new
  end
end

class Round
  def initialize(players, deck)
    @players = players
    @deck = deck
  end

  def play
    prepare
    make_moves
    define_winner
  end

  private

  def prepare
    @players.each do |player| # очищает эти карты из массива
    end

    def make_moves; end

    def define_winner
      @players.sample
    end

    # @players.each move = player.make_move #игрок делает ход
    # case make_move
    # when :skip
    # when :take
    #       players << deck.take_card
    # when :open
    #   finish_round
    # end
  end
end

class Game
  def initialize
    @players = [User.new('Player name'), Dealer.new]
    @deck = Deck.new
  end

  def start
    # fasdfas\
    winner = Round.new(@players, @deck)
    process_winner(winner)
  end
end
