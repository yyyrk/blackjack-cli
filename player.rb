class Player
  attr_accessor :name, :cards, :balance

  def initialize(name = "Игрок")
    @name = name
    @cards = []
    @balance = 100
  end

  def points
    total = 0
    ace_count = 0

    @cards.each do |card|
      if ['J', 'Q', 'K'].include?(card.rank)
        total += 10
      elsif card.rank == 'A'
        total += 11
        ace_count += 1
      else
        total += card.rank.to_i
      end
    end

    ace_count.times { total -= 10 if total > 21 }
    total
  end

  def reset_cards
    @cards.clear
  end
end