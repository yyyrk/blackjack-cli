class User < Player
  def make_move
    puts "Твои карты:"
    cards.each_with_index { |card, index| puts "Карта #{index + 1}: #{card}" }
    puts "Сумма твоих очков: #{points}"

    puts 'Выберите действие:'
    puts '1. Пропустить ход (Skip)'
    puts '2. Взять карту (Take card)'
    puts '3. Открыть карты (Open cards)'

    print 'Ваш выбор: '
    action = gets.chomp.to_i

    case action
    when 1 then :skip
    when 2 then :take
    when 3 then :open_cards
    else
      puts 'Неверный выбор! Попробуйте снова.'
      make_move
    end
  end
end
