class Game
  def initialize
    @deck = Deck.new
    @players = [Player.new, Dealer.new] # Игрок и дилер
  end

  def start
    player_name = ask_for_name
    @players.first.name = player_name # Устанавливаем имя игрока

    puts "Добро пожаловать в игру Blackjack, #{player_name}!"

    loop do
      take_bets
      display_balances
      play_round
      calculate_results

      break unless play_again?
    end

    puts 'Игра завершена, у одного из игроков закончились деньги.'
  end

  private

  def ask_for_name
    print 'Введите ваше имя латиницей: '
    gets.chomp
  end

  def take_bets
    @players.each do |player|
      if player.balance >= 10
        puts "#{player.name} ставит 10 долларов"
        player.balance -= 10
      else
        puts "#{player.name} не может поставить ставку. У него недостаточно денег."
        break
      end
    end
  end

  def play_round
    reset_players_cards
    deal_initial_cards
    show_player_cards

    player_move
    dealer_move

    display_cards(@players[1])  # Показываем карты дилера после хода игрока
  end

  def reset_players_cards
    @players.each(&:reset_cards)
  end

  def deal_initial_cards
    2.times do
      @players.each do |player|
        player.cards << @deck.deal
      end
    end
  end

  def show_player_cards
    puts "Твои карты:"
    display_cards(@players[0])
  end

  def player_move
    puts "Выберите действие:"
    puts "1. Пропустить ход"
    puts "2. Взять карту"
    puts "3. Открыть карты"
    print "Ваш выбор: "
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "Ты пропустил ход."
    when 2
      @players[0].cards << @deck.deal
      puts "Твои новые карты:"
      display_cards(@players[0])
    when 3
      display_cards(@players[0])
      display_dealer_cards(@players[1])
      calculate_results
    else
      puts "Неверный выбор!"
    end
  end

  def dealer_move
    if @players[1].points < 17
      @players[1].cards << @deck.deal
      puts "Дилер берет карту."
    end
  end

  def display_cards(player)
    player.cards.each_with_index do |card, index|
      puts "Карта #{index + 1}: #{card.to_s}"
    end
    puts "Сумма очков у #{player.name}: #{player.points}"
  end

  def display_dealer_cards(dealer)
    puts "Карты дилера:"
    dealer.cards.each_with_index do |card, index|
      if index == 1
        puts "Карта #{index + 1}: ??"
      else
        puts "Карта #{index + 1}: #{card.to_s}"
      end
    end
    puts "Сумма очков у дилера: #{dealer.points}"
  end

  def calculate_results
    player = @players[0]
    dealer = @players[1]

    if player.points > 21
      puts "#{player.name} проиграл! Перебор!"
      dealer.balance += 20
    elsif dealer.points > 21
      puts "Дилер проиграл! Перебор!"
      player.balance += 20
    elsif player.points > dealer.points
      puts "#{player.name} победил!"
      player.balance += 20
    elsif player.points < dealer.points
      puts "Дилер победил!"
      dealer.balance += 20
    else
      puts "Ничья! Ставка возвращается."
    end
  end

  def play_again?
    puts 'Играть снова? (y/n)'
    gets.chomp.downcase == 'y'
  end

  def display_balances
    puts "\nТекущий баланс игроков:"
    @players.each do |player|
      puts "#{player.name}: $#{player.balance}"
    end
    puts "-" * 30
  end
end
