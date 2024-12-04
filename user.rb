class User < Player
  def make_move
    display_cards_and_points

    puts 'Выберите действие:'
    puts '1. Пропустить ход (Skip)'
    puts '2. Взять карту (Take card)'
    puts '3. Открыть карты (Open cards)'

    action = get_user_choice
    process_move(action)
  end

  private

  def display_cards_and_points
    puts "Твои карты:"
    @cards.each_with_index { |card, index| puts "Карта #{index + 1}: #{card}" }
    puts "Сумма твоих очков: #{points}"
  end

  def get_user_choice
    print 'Ваш выбор: '
    choice = gets.chomp.to_i
    raise InvalidChoiceError, 'Неверный выбор! Попробуйте снова.' unless valid_choice?(choice)

    choice
  end

  def valid_choice?(choice)
    [1, 2, 3].include?(choice)
  end

  def process_move(choice)
    case choice
    when 1 then :skip
    when 2 then :take
    when 3 then :open_cards
    end
  end
end

class InvalidChoiceError < StandardError; end
