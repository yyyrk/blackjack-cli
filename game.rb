require_relative 'player'
require_relative 'deck'
require_relative 'round'

class Game
  def initialize
    @players = [User.new, Dealer.new]
    @deck = Deck.new
  end

  def start
    loop do
      take_bets
      break if @players.any? { |player| player.balance <= 0 }

      play_round
      calculate_results
      break unless play_again?
    end

    puts 'Игра завершена, у одного из игроков закончились деньги.'
  end

  private

  # Логика ставок
  def take_bets
    @players.each do |player|
      if player.balance >= 10
        puts "#{player.class} ставит 10 долларов."
        player.balance -= 10
      else
        puts "#{player.class} не может поставить ставку. У него недостаточно денег."
        break
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

    if player_points > 21
      puts "Игрок проиграл, превысил 21 очко."
    elsif dealer_points > 21
      puts "Дилер проиграл, превысил 21 очко."
    elsif player_points == dealer_points
      puts "Ничья! Баланс игроков возвращен."
    elsif player_points > dealer_points
      puts "Игрок победил!"
      @players.first.balance += 20  # Игрок выигрывает 20 долларов
    else
      puts "Дилер победил!"
      @players.last.balance += 20  # Дилер выигрывает 20 долларов
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
    puts "Игроки, ваши карты:"
    @players.each do |player|
      puts "#{player.class}: #{player.cards.map { |card| card.to_s }.join(', ')} - Очки: #{player.points}"
    end
  end

end
