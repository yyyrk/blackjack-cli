class Deck
  attr_reader :cards

  def initialize
    @cards = generate_deck.shuffle
  end

  def deal
    raise 'Колода пуста' if @cards.empty? # Добавил исключение, если будет браться карта из пустой колоды
    @cards.pop
  end

  private

  def generate_deck
    Card::SUITS.product(Card::RANKS).map do |suit, rank| # Использую здесь метод .product для создания всевозможных сочетаний карт
      Card.new(rank, suit)
    end
  end
end
