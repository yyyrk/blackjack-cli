# frozen_string_literal: true

user
dealer

deck
card
round


class Player
  def initialize
    @cards = []
    @balance = 100
  end

  def points ## логика если 2 туза то вычитать 10 и тп. Все это здесь
    @cards.count
  end

  make_move

end
