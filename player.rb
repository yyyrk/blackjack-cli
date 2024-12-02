require_relative 'card'

class Player
  attr_reader :cards, :balance
  attr_writer :balance

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
    ace_count = 0

    # Подсчитываем очки всех карт
    @cards.each do |card|
      if card.rank == 'A'
        ace_count += 1
        total_points += 11
      else
        total_points += card.value
      end
    end

    # Если туз (ace) и сумма больше 21, меняем туз на 1
    ace_count.times do
      total_points -= 10 if total_points > 21
    end

    total_points
  end


  def make_move
    raise NotImplementedError, 'Этот метод должен быть определен в подклассах!!!'
  end
end