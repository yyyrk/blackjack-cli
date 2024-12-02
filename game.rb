class Game
  def initialize
    @players = [User.new, Dealer.new]
    @deck = Deck.new
  end

  def start
    loop do
      take_bets # Применение ставок
      play_round
      calculate_results # Подсчет результатов
      break unless play_again?
    end
  end

  private

  # Метод для ставок
  def take_bets
    @players.each do |player|
      if player.balance < 10
        puts "#{player.class.name} не может сделать ставку, так как у него недостаточно средств."
        puts "Игра завершена."
        exit # Завершаем игру, если у кого-то из игроков недостаточно денег для ставки
      else
        player.instance_variable_set(:@balance, player.balance - 10) # Снимаем 10 долларов с баланса игрока
        puts "#{player.class.name} поставил 10 долларов. Баланс: #{player.balance}."
      end
    end
  end

  # Метод для проведения раунда игры
  def play_round
    Round.new(@players, @deck).play
  end

  # Метод для подсчета результатов игры
  def calculate_results
    user_points = @players[0].points
    dealer_points = @players[1].points

    puts "Игрок очки: #{user_points}, Дилер очки: #{dealer_points}"

    winner = nil # Изначально у нас нет победителя

    if user_points > 21
      puts "Игрок перебрал! Дилер выигрывает."
      winner = @players[1]
    elsif dealer_points > 21
      puts "Дилер перебрал! Игрок выигрывает."
      winner = @players[0]
    elsif user_points > dealer_points
      puts "Игрок выигрывает!"
      winner = @players[0]
    elsif dealer_points > user_points
      puts "Дилер выигрывает!"
      winner = @players[1]
    else
      puts "Ничья! Ставки возвращаются игрокам."
      @players.each { |player| player.instance_variable_set(:@balance, player.balance + 10) } # Возврат ставок
    end

    # Вызов метода для вывода информации о победителе
    process_winner(winner)
  end

  # Метод для вывода информации о победителе
  def process_winner(winner)
    if winner.nil?
      puts "Это была ничья, ставки возвращаются игрокам."
    else
      puts "#{winner.class.name} победил! Он забирает 20 долларов."
    end
  end

  # Метод для предложения продолжить игру
  def play_again?
    puts 'Играть снова? (y/n)'
    gets.chomp.downcase == 'y'
  end
end
