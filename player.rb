# frozen_string_literal: true

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