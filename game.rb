class Game
  def initialize
    @players = [User.new, Dealer.new]
    @deck = Deck.new
  end

  def start
    loop do
      take_bets      # Сделать ставки
      play_round     # Играть раунд
      calculate_results  # Подсчитать результаты
      break unless play_again?  # Запросить, хочет ли игрок продолжить
    end
  end

  private

  # Логика ставок
  def take_bets
    @players.each do |player|
      if player.balance >= 10
        player.balance -= 10
      else
        puts "#{player.class} не может сделать ставку, так как не хватает денег!"
        exit
      end
    end
  end

  # Игровой процесс раунда
  def play_round
    Round.new(@players, @deck).play
  end

  # Подсчет результатов
  def calculate_results
    player_points = @players.first.points
    dealer_points = @players.last.points

    puts "Игрок: #{player_points}, Дилер: #{dealer_points}"

    if player_points > 21
      puts 'Игрок проиграл, перебрал очки!'
      @players.last.balance += 20  # Дилер выигрывает
    elsif dealer_points > 21
      puts 'Дилер проиграл, перебрал очки!'
      @players.first.balance += 20  # Игрок выигрывает
    elsif player_points > dealer_points
      puts 'Игрок выигрывает!'
      @players.first.balance += 20  # Игрок выигрывает
    elsif dealer_points > player_points
      puts 'Дилер выигрывает!'
      @players.last.balance += 20  # Дилер выигрывает
    else
      puts 'Ничья! Деньги возвращаются игрокам.'
      @players.each { |player| player.balance += 10 }  # Возврат ставок
    end
  end

  # Запросить, хочет ли игрок продолжить игру
  def play_again?
    puts 'Играть снова? (y/n)'
    gets.chomp.downcase == 'y'
  end

  # Обработка победителя
  def process_winner(winner)
    puts "Победитель: #{winner.class}"
  end
end
