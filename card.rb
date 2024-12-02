class Card

  SUITS = ['♠', '♥', '♦', '♣']
  RANKS = { 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => '10',
            'J' => 'Валет', 'Q' => 'Дама', 'K' => 'Король', 'A' => 'Туз' }

  attr_reader :suit, :rank, :value

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = set_value
  end

  # Устанавливаем значение карты для подсчёта очков
  def set_value
    case rank
    when 'A' then 1  # Туз по умолчанию 1
    when 'J', 'Q', 'K' then 10  # Валет, Дама, Король — 10 поинтов
    else rank.to_i  # Для числовых карт буду возвращать их числовое значение
    end
  end

  # Метод для вывода карты в удобном формате
  def to_s
    "#{rank}#{suit}"
  end
end
