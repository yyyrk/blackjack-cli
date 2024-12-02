class User < Player
  def make_move
    puts 'Уважаемый Игрок, Вас доступны следующие действия:'
    puts '1. Пропустить ход (Skip)'
    puts '2. Взять карту (Take card)'
    puts '3. Открыть карты (Open cards)'

    print 'Выберите цифру: '
    action = gets.chomp.to_i

    case action
    when 1 then :skip
    when 2 then :take
    when 3 then :open_cards
    else
      puts 'Нет такого пункта в меню!!!'
      make_move
    end
  end
end
