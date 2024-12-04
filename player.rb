class Player
  attr_accessor :name, :cards, :balance

  def initialize(name = 'Игрок')
    @name = name
    @cards = []
    @balance = 100
  end

  def points
    total_points = 0
    ace_count = 0

    @cards.each do |card|
      case card.rank # Вместо if else переделал на case для лучшей читаемости и компактности
      when 'J', 'Q', 'K' then total_points += 10
      when 'A'
        total_points += 11
        ace_count += 1
      else
        total_points += card.rank.to_i
      end
    end

    ace_count.times { total_points -= 10 if total_points > 21 }
    total_points
  end

  def reset_cards
    @cards.clear
  end

  def add_card(card)
    raise ArgumentError, 'Неверная карта!!!' unless card.is_a?(Card) # На всякий случай добавил исключение чтобы предотвратить попадание некорректных данных в массив
    @cards << card
  end
end
