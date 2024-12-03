class Player
  attr_accessor :cards, :balance, :name

  def initialize
    @cards = []
    @balance = 100
    @name = ""
  end

  def add_card(card)
    @cards << card
  end

  def reset_cards
    @cards.clear
  end

  def points
    total_points = 0
    ace_count = 0

    cards.each do |card|
      if card.rank == 'A'
        ace_count += 1
        total_points += 11
      else
        total_points += card.value
      end
    end

    ace_count.times { total_points -= 10 if total_points > 21 }
    total_points
  end

  def make_move
    raise NotImplementedError, 'Этот метод должен быть определен в подклассах!!!'
  end
end