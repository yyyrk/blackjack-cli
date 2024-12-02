class Player
  attr_reader :cards, :balance
  def initialize
    @cards = []
    @balance = 100
  end

  def add_card(card)
    @cards << card
  end
  def reset_cards # cбрасывает карты перед новым раундом
    @cards.clear
  end

  def points
    @balance # здесь будет логика подсчета очков
  end
  def make_move # показывает ход игрока или дилера и переопред в подклассах
    raise NotImplementedError, 'Этот метод должен быть определен в подклассах!!!'
  end
end

class User < Player  # у него есть опции:take :skip :open
  def make_move
    puts 'Уважаемый Игрок, Вас доступны следующие действсия:'
    print '1. Skip. 2. Take card. 3 Open Cards. Выберите цифру: '# деламе ходы и на выбор действия, потом проверяю в отдельном методе приватном
    case action
    when 1 then :skip
    when 2 then :take
    when 3 then :open_card
    else
      puts 'Нет такого пункта в меню!!!'
      make_move
    end
  end
end

class Dealer < Player #можно сделать дилера чтобы он на угад ходил в будущем
  def make_move
    points > 17 ? :take : :skip
  end
end

class Deck #здесь управляем колодой карт.
  def initialize
    generate_deck
    shuffle_cards
  end
  def take_card
    generate_deck if @cards.empty?
    @cards.pop # удаляет и возвращает последний элемент массива @cards
  end

  private
  def shuffle_cards
    @cards.shuffle! # изменяет текущий(!) массив и возвращает его
  end
  def generate_deck
    # создание 52 карт
  end
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
    @players.each do |player|
      2.times { player.add_card(@deck.take_card) }
    end
  end
  def make_moves
      # здесь логика ходов
  end

  def define_winner
      #подсчет очков и определение победителя
  end
end

class Game
  def initialize
    @players = [User.new, Dealer.new]
    @deck = Deck.new
  end

  def start
    loop do
      take_bets # сделать ставки/ Ее смысл что берет у каждого игрока баланс и уменьшает на 10, если баланс 0, то игра окончена, то высести результаты
      play_round
      calculate_results
      break unless play_again?
    end
  end

  private
  def take_bets
    #здесь логика ставок
  end
  def play_round
    Round.new(@players, @deck).play
  end
  def calculate_results
    # Логика подсчета итогов
  end

  def play_again?
    puts 'Играть снова? (y/n)'
    gets.chomp.downcase == 'y'
  end

  def process_winner(winner)
    # выводит информацию о победителе
  end
end