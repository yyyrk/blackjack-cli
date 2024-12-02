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

  private

  # Раздача по 2 карты игрокам
  def prepare
    @players.each do |player|
      2.times { player.add_card(@deck.take_card) }
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

  # Считаем очки и определяем победителя
  def define_winner
    player_points = points(@players[0])
    dealer_points = points(@players[1])

    if player_points > 21
      puts 'Игрок перебрал! Победил дилер.'
    elsif dealer_points > 21
      puts 'Дилер перебрал! Победил игрок.'
    elsif player_points > dealer_points
      puts 'Игрок победил!'
    elsif dealer_points > player_points
      puts 'Дилер победил!'
    else
      puts 'Ничья!!!'
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
