class Game
  attr_reader :players, :deck

  def initialize
    @deck = Deck.new
    @players = [User.new, Dealer.new]
  end

  def start
    player_name = ask_for_name
    players.first.name = player_name

    puts "Добро пожаловать в игру Blackjack, #{player_name}!"
    game_loop
  end

  private

  def game_loop
    loop do
      play_round
      display_balances
      break unless play_again?
    end

    puts 'Игра завершена, у одного из игроков закончились деньги или мотивация.'
  end

  def play_round
    take_bets
    reset_round

    deal_cards

    player_turn
    dealer_turn

    display_cards(players[1]) # Дилер

    calculate_results
  end

  def take_bets
    players.each do |player|
      if player.balance >= 10
        player.balance -= 10
        puts "#{player.name} ставит 10 $"
      else
        puts "#{player.name} не может поставить ставку. У него недостаточно денег."
        break
      end
    end
  end

  def reset_round
    players.each(&:reset_cards) # Сбрасываем карты перед раздачей
  end

  def deal_cards
    2.times { players.each { |player| player.cards << deck.deal } }
  end

  def show_player_cards
    puts "Твои карты:"
    display_cards(players.first)
  end

  def player_turn
    action = players.first.make_move
    case action
    when :skip then puts "#{players.first.name} пропустил ход."
    when :take then deal_card_to_player
    when :open_cards then reveal_cards
    end
  end

  def deal_card_to_player
    players.first.cards << deck.deal
    puts "Ты взял карту."
    display_cards(players.first) # Отображаем карты только после того, как игрок взял карту
  end

  def dealer_turn
    puts "Ход дилера:"
    while players[1].points < 17
      dealer_move(players[1])  # Используем метод для добавления карты
      puts "Дилер берет карту."
      display_cards(players[1])  # Показываем карты дилера после каждого хода
    end
  end

  def dealer_move(dealer)
    return if dealer.points >= 17

    dealer.add_card(@deck.deal)
  end

  def display_cards(player)
    player.cards.each_with_index do |card, index|
      puts "Карта #{index + 1}: #{card}"
    end
    puts "Сумма очков у #{player.name}: #{player.points}"
  end

  def calculate_results
    player, dealer = players

    if player.points > 21
      puts "#{player.name} проиграл!!! Перебор!"
      dealer.balance += 20
    elsif dealer.points > 21
      puts "Дилер проиграл!!! Перебор!"
      player.balance += 20
    elsif player.points > dealer.points
      puts "#{player.name} победил!!!"
      player.balance += 20
    elsif player.points < dealer.points
      puts "Дилер победил!!!"
      dealer.balance += 20
    else
      puts "Ничья!!! Ставка возвращается."
    end
  end

  def play_again?
    print 'Играть снова? (y/n): '
    answer = gets.chomp.downcase
    answer == 'y'
  end

  def ask_for_name
    print 'Введите ваше имя латиницей: '
    gets.chomp
  end

  def display_balances
    puts "\nТекущее количество грошей у игроков:"
    players.each { |player| puts "#{player.name}: $#{player.balance}" }
    puts "-" * 30
  end
end
