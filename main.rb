require_relative 'card'

class Player
  attr_reader :cards, :balance

  def initialize
    @cards = []
    @balance = 100
  end

  def add_card(card)
    @cards << card
  end

  def reset_cards
    @cards.clear
  end

  # Метод для подсчёта очков, учитывая особенность туза
  def points
    total_points = 0
    aces_count = 0 # Считаем количество тузов(aces)

    @cards.each do |card|
      total_points += card.value
      aces_count += 1 if card.rank == 'A'
    end

    # Если есть тузы, и сумма с ними меньше 12, то мы можем сделать туз равным 11
    aces_count.times do
      total_points += 10 if total_points + 10 <= 21
    end

    total_points
  end

  def make_move
    raise NotImplementedError, 'Этот метод должен быть определен в подклассах!!!'
  end
end


class User < Player # у него есть опции:take :skip :open
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

class Dealer < Player # можно сделать дилера чтобы он на угад ходил в будущем
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
      take_bets # Применение ставок
      play_round
      calculate_results
      break unless play_again?
    end
  end

  private

  # Метод для ставок
  def take_bets
    @players.each do |player|
      if player.balance < 10
        puts "#{player.class.name} не может сделать ставку, так как у него недостаточно средств."
        puts "Игра завершена."
        exit # Завершаем игру, если у кого-то из игроков недостаточно денег для ставки
      else
        player.instance_variable_set(:@balance, player.balance - 10) # Снимаем 10 долларов с баланса игрока
        puts "#{player.class.name} поставил 10 долларов. Баланс: #{player.balance}."
      end
    end
  end

  # Метод для проведения раунда игры
  def play_round
    Round.new(@players, @deck).play
  end

  # Метод для подсчета результатов и определения победителя
  def calculate_results
    # Реализуем логику подсчета итогов игры
  end

  # Метод для предложения продолжить игру
  def play_again?
    puts 'Играть снова? (y/n)'
    gets.chomp.downcase == 'y'
  end

  def process_winner(winner)
    # Выводит информацию о победителе
  end
end
