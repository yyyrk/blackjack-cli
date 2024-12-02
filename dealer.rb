class Dealer < Player
  def make_move
    if points >= 17
      :skip # Если у дилера 17 или больше очков, он пропускает ход
    else
      :take # Если у дилера меньше 17 очков, он берет карту
    end
  end
end
