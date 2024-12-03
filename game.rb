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
        puts "#{player.name || player.class} ставка 10 долларов"
        player.balance -= 10
      else
        puts "#{player.name || player.class} не может поставить ставку. У него недостаточно денег."
        break
      end
    end
  end

  def play_round
    display_balances
    reset_players_cards
    Round.new(@players, @deck).play


    puts "Твои карты:"
    display_cards(@players[0])


    puts "Карты дилера:"
    display_dealer_cards(@players[1])
  end

  # Здесь вывожу карты игрока
  def display_cards(player)
    player.cards.each_with_index do |card, index|
      puts "Карта #{index + 1}: #{card.to_s}"
    end
    puts "Сумма очков у тебя: #{player.points}"
  end

  # Здесь вывожу карты диллера с скрытием одной из карт
  def display_dealer_cards(dealer)
    puts "Карта 1: #{dealer.cards[0].to_s}"
    puts "Карта 2: #{dealer.cards[1].to_s.gsub(/./, '?')}" # Скрываю вторую карту
  end

  def calculate_results
    winner = Round.new(@players, @deck).define_winner
    case winner
    when :player
      @players[0].balance += 20
    when :dealer
      @players[1].balance += 20
    else
      puts "Ставка возвращается игрокам."
    end
  end

  def play_again?
    puts 'Играть снова? (y/n)'
    gets.chomp.downcase == 'y'
  end

  def display_balances
    puts "\nТекущий баланс игроков:"
    @players.each do |player|
      player_type = player.is_a?(User) ? "Игрок" : "Дилер"
      puts "#{player_type}: $#{player.balance}"
    end
    puts "-" * 30
  end

  def reset_players_cards
    @players.each(&:reset_cards)
  end
end
