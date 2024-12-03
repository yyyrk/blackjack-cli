require_relative 'player'
require_relative 'deck'

class Round
  def initialize(players, deck)
    @players = players # Массив игроков (игрок и дилер)
    @deck = deck # Колода карт
  end

  def play
    prepare # Карты раздаются
    make_moves # Здесь игроки ходят
    define_winner # Подсчитываются результаты и определение победителя
  end

  def define_winner
    player = @players[0]
    dealer = @players[1]

    if player.points > 21
      :dealer
    elsif dealer.points > 21
      :player
    elsif player.points == dealer.points
      :draw
    elsif player.points > dealer.points
      :player
    else
      :dealer
    end
  end

  private

  # Метод для подготовки к новому раунду: сброс карт и раздача новых
  def prepare
    @players.each do |player|
      player.reset_cards # Сбрасываем карты игрока
      2.times { player.add_card(@deck.take_card) } # Раздаем по 2 карты
    end
  end
  # Здесь логика ходов игроков
  def make_moves
    # Ход игрока
    @players[0].make_move # Игрок принимает решение: skip, take, или open_card

    # Тут ход дилера
    # Дилер делает ход, если у него меньше 17 очков, он берет карту
    if points(@players[1]) < 17
      @players[1].add_card(@deck.take_card)
    end
  end

  def display_winner
    case define_winner
    when :player
      puts "Игрок победил!"
    when :dealer
      puts "Дилер победил!"
    when :draw
      puts "Ничья!"
    end
  end

  # Это метод для подсчета очков игрока
  def points(player)
    total_points = 0
    ace_count = 0 # Для учета тузов (ace)

    player.cards.each do |card|
      total_points += card.value
      ace_count += 1 if card.rank == 'A'
    end

    # Здесь идет пересчет очков для тузов, имею ввиду, что если больше 21, туз будет стоить 1
    ace_count.times do
      total_points -= 10 if total_points > 21
    end

    total_points
  end
end
