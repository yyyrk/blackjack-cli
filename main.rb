require_relative 'card'




class User < Player # у него есть опции:take :skip :open
  def make_move
    puts 'Уважаемый Игрок, Вас доступны следующие действсия:'
    print '1. Skip. 2. Take card. 3 Open Cards. Выберите цифру: '# деламе ходы и на выбор действия, потом проверяю в отдельном методе приватном
    case action
    when 1 then :skip
    when 2 then :take
    when 3 then :open_card
    else
      puts 'Нет такого пункта в меню!!!'
      make_move
    end
  end
end

class Dealer < Player # можно сделать дилера чтобы он на угад ходил в будущем
  def make_move
    points > 17 ? :take : :skip
  end
end
