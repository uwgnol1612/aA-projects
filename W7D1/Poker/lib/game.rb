require_relative './player'
require_relative './deck'

class Game
  attr_reader :players, :pot, :deck

  def initialize

  end

  def play

  end

  def play_round

  end

  def reset_players

  end

  def deal_cards


  end

  def take_bets

  end

  def display_status(index, high_bet)

  end

  def trade_cards

  end

  def end_round

  end

  def return_cards

  end

  def winner

  end

  def show_hands

  end

  def add_to_pot(amount)

  end

  def round_over?

  end

  def game_over?

  end

  def add_players(n, buy_in)

  end

  def end_game
    puts "Game Over!"
  end
end

def test
  g = Game.new
  g.add_players(5, 100)
  g.play
end

if __FILE__ == $PROGRAM_NAME
  test
end
