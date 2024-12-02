# frozen_string_literal: true
require_relative 'player'
require_relative 'deck'

class Round
  def initialize(players, deck)
    @players = players  # Массив игроков (игрок и дилер)
    @deck = deck  # Колода карт
  end

  def play
    prepare  # Раздача карт
    make_moves  # Ходы игроков
    define_winner  # Подсчет результатов и определение победителя
  end

  private

  # Подготовка раунда: раздача по 2 карты каждому игроку
  def prepare
    @players.each do |player|
      2.times { player.add_card(@deck.take_card) }
    end
  end

  # Логика ходов игроков
  def make_moves
    # Ход игрока
    @players[0].make_move  # Игрок принимает решение: skip, take, или open_card

    # Ход дилера
    # Дилер делает ход, если у него меньше 17 очков, он берет карту
    if points(@players[1]) < 17
      @players[1].add_card(@deck.take_card)
    end
  end

  # Подсчет очков и определение победителя
  def define_winner
    player_points = points(@players[0])
    dealer_points = points(@players[1])

    if player_points > 21  # Если у игрока перебор
      puts 'Игрок перебрал! Победил дилер.'
    elsif dealer_points > 21  # Если у дилера перебор
      puts 'Дилер перебрал! Победил игрок.'
    elsif player_points > dealer_points
      puts 'Игрок победил!'
    elsif dealer_points > player_points
      puts 'Дилер победил!'
    else
      puts 'Ничья!'
    end
  end

  # Метод для подсчета очков игрока
  def points(player)
    total_points = 0
    ace_count = 0  # Для учета тузов

    player.cards.each do |card|
      total_points += card.value
      ace_count += 1 if card.rank == 'A'
    end

    # Перерасчет очков для тузов (если больше 21, туз будет стоить 1)
    ace_count.times do
      total_points -= 10 if total_points > 21
    end

    total_points
  end
end
