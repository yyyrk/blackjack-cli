class Card
  SUITS = ['♠', '♥', '♦', '♣']
  RANKS = { 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => '10',
            'J' => 'Валет', 'Q' => 'Дама', 'K' => 'Король', 'A' => 'Туз' }

  attr_reader :suit, :rank, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = set_value
  end

  def set_value
    case rank
    when 'A' then 1
    when 'J', 'Q', 'K' then 10
    else rank.to_i
    end
  end

  def to_s
    "#{rank}#{suit}"
  end
end
