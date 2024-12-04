class Round
  def initialize(players, deck)
    @players = players
    @deck = deck
  end

  def play
    prepare
    make_moves
    display_winner
  end

  private

  def prepare
    @players.each { |player| player.reset_cards }
    2.times { @players.each { |player| player.add_card(@deck.deal) } }
  end

  def make_moves
    player_move(@players[0])
    dealer_move(@players[1])
  end

  def player_move(player)
    case player.make_move
    when :skip then puts "#{player.name} пропустил ход."
    when :take then player.add_card(@deck.deal)
    when :open_cards then
      display_cards(player)
      display_cards(@players[1])
      display_winner
    else
      raise "Неверное действие игрока"
    end
  end

  def display_winner
    case winner
    when :player then puts "Игрок победил!"
    when :dealer then puts "Дилер победил!"
    when :draw then puts "Ничья!"
    end
  end

  def winner
    player = @players[0]
    dealer = @players[1]

    if player.points > 21 then :dealer
    elsif dealer.points > 21 then :player
    elsif player.points == dealer.points then :draw
    elsif player.points > dealer.points then :player
    else :dealer
    end
  end
end
