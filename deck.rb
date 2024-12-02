# frozen_string_literal: true

class Deck
  def initialize
    generate_deck
    shuffle_cards
  end

  # Метод для создания колоды карт
  def generate_deck
    suits = ['♠', '♥', '♦', '♣']  # Масти карт
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']  # Номиналы карт

    @cards = []

    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(rank, suit)  # Создаем объект карты и добавляем в колоду
      end
    end
  end

  def take_card
    generate_deck if @cards.empty?
    @cards.pop  # Убираем и возвращаем последнюю карту из колоды
  end

  private

  def shuffle_cards
    @cards.shuffle!  # Перемешиваем карты
  end
end
