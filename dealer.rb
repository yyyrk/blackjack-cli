class Dealer < Player
  DEFAULT_NAME = 'Дилер'

  def initialize
    super(DEFAULT_NAME)
  end

  def make_move
    return :skip if points >= 17
    :take
  end
end
