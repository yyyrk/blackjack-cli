class Player
  def initialize
    @cards = []
    @balance = 100
  end
  def points
    @balance
  end
  def make_move

  end
end

class User < Player
  def make_move
    puts 1.# деламе ходы и на выбор действия, потом проверяю в отдельном методе приватном

      case 1 #:take :skip :open
    :take
  end
end

class Dealer < Player #можно сделать дилера чтобы он на угад ходил
  def make_move
    points > 17 ? :take : :skip
  end
end

class Deck
  initialize
  # @cards = 52.times.map do @cards << Card.new #Псевдокод, где 52 раза генерим карты
  def take_card
    generate_deck if @cards.empty?
  end


  private
  def shuffle_cards
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
    player.cards = []
    player.cards << deck.take_card #по 2 раза
    end

    def make_moves; end

    def define_winner
      @players.sample
    end

  #=================
  @players.each move = player.make_move #игрок делает ход
  make_move = player.make_move
  case make_move
  when :take player << deck.take_card
  when :skip
  when :open finish_round
  end
end

class Game
  def initialize
    @players = [User.new('Player name'), Dealer.new]
    @deck = Deck.new
  end

  def start
    loop do
    take_bets#сделать ставки/ Ее смысл что берет у каждого игрока баланс и уменьшает на 10, если баланс 0, то игра окончена, то высести результаты
    play_round
    calculate_results # берет игроков, смотрит их очки и начисляет выйгрыш
    end
    winner = Round.new(@players, @deck)
    process_winner(winner)
  end

  private
  def take_bets

  end
  def play_round
    Round.new(@players, @deck).play
  end
  def calculate_results

  end
end




  deck = Deck.new
  deck.deal_card