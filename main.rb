class Player
  def initialize
    @cards = []
    @balance = 100
  end

  def add_card(card)
    @cards << card
  end
  def reset_cards;  end # cбрасывает карты перед новым раундом

  def points
    @balance
  end
  def make_move;  end


end

class User < Player  # у него есть эти опции:take :skip :open
  def make_move
    puts 1.# деламе ходы и на выбор действия, потом проверяю в отдельном методе приватном

      case 1
    :take
  end
end

class Dealer < Player #можно сделать дилера чтобы он на угад ходил в будущем
  def make_move
    points > 17 ? :take : :skip
  end
end

class Deck #здесь управляем колодой карт.
  initialize
  # @cards = 52.times.map do @cards << Card.new #Псевдокод, где 52 раза генерим карты
  def take_card
    generate_deck if @cards.empty?
  end

  private
  def shuffle_cards; end
  def generate_deck; end
end

class Round #этот класс это абстракция игрового раунда
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

    def make_moves; end # это цикл ходов игроков

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
    take_bets # сделать ставки/ Ее смысл что берет у каждого игрока баланс и уменьшает на 10, если баланс 0, то игра окончена, то высести результаты
    play_round
    calculate_results # берет игроков, смотрит их очки и начисляет выйгрыш
    end
    winner = Round.new(@players, @deck)
    process_winner(winner)
  end

  private
  def take_bets #обрабатываем здесь ставки игроков

  end
  def play_round
    Round.new(@players, @deck).play
  end
  def calculate_results # обновляет результаты (балансы игроков)

  end

  def process_winner(winner) # выводит информацию о победителе

  end
end




  deck = Deck.new
  deck.deal_card