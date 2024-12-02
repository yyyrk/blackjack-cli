class Game
  def initialize
    @players = [User.new, Dealer.new]
    @deck = Deck.new
  end

  def start
    puts "Добро пожаловать в игру Blackjack, #{ask_for_name}!"

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

  # Здесь запрашиваю имя пользователся
  def ask_for_name
    print 'Введите ваше имя латиницей: '
    gets.chomp
  end

  def take_bets
    @players.each do |player|
      if player.balance >= 10
        puts "#{player.name || player.class} ставит 10 долларов."
        player.balance -= 10
      else
        puts "#{player.name || player.class} не может поставить ставку. У него недостаточно денег."
        break
      end
    end
  end

  def play_round
    Round.new(@players, @deck).play


    puts "Твои карты:"
    display_cards(@players[0])


    puts "Карты дилера:"
    display_dealer_cards(@players[1])
  end

  # Здесь вывожу карты игрока
  def display_cards(player)
    player.cards.each_with_index do |card, index|
      puts "Карт #{index + 1}: #{card.to_s}"
    end
    puts "Сумма очков у тебя: #{player.points}"
  end

  # Здесь вывожу карты диллера с скрытием одной из карт
  def display_dealer_cards(dealer)
    puts "Карт 1: #{dealer.cards[0].to_s}"
    puts "Карт 2: #{dealer.cards[1].to_s.gsub(/./, '?')}" # Скрываю вторую карту
  end

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

  def play_again?
    puts 'Играть снова? (y/n)'
    gets.chomp.downcase == 'y'
  end
end
