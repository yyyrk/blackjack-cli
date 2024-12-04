class Card
  attr_reader :rank, :suit

  SUITS = ['♠', '♥', '♦', '♣'].freeze # Замораживаю для улучшения производительности и безопасности
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze

  def initialize(rank, suit)
    raise ArgumentError, 'Invalid rank' unless RANKS.include?(rank)
    raise ArgumentError, 'Invalid suit' unless SUITS.include?(suit)

    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end
