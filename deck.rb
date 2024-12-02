class Deck
  def initialize
    generate_deck
    shuffle_cards
  end

  def generate_deck
    suits = ['♠', '♥', '♦', '♣']
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    @cards = []
    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def take_card
    generate_deck if @cards.empty?
    @cards.pop
  end

  private

  def shuffle_cards
    @cards.shuffle!
  end
end