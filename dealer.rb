class Dealer < Player
  def initialize
    super()
    @name = "Дилер"
  end

  def make_move
    points >= 17 ? :skip : :take
  end
end
