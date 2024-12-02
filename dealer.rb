class Dealer < Player
  def make_move
    points >= 17 ? :skip : :take
  end
end