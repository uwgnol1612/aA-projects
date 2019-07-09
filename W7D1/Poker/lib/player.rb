class Player
  attr_reader :bankroll, :hand, :current_bet

  include Comparable

  def self.buy_in(bankroll)

  end

  def initialize(bankroll)

  end

  def deal_in(hand)

  end

  def respond_bet

  end

  def get_bet

  end

  def get_cards_to_trade

  end

  def take_bet(total_bet)

  end

  def reset_current_bet

  end

  def receive_winnings(amount)

  end

  def return_cards

  end

  def fold

  end

  def unfold

  end

  def folded?

  end

  def trade_cards(old_cards, new_cards)

  end

  def <=>(other_player)
    hand
    other_player.hand
    hand <=> other_player.hand
  end
end
