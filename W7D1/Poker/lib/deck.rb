require_relative 'card'
require_relative 'hand'

class Deck

  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end 
    end 
    cards 
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def deal_hand
    cards = self.take(5)
    hand = Hand.new(cards)
    hand
  end

  def count
    @cards.count
  end

  def take(n)
    raise "not enough cards" if n > count
    @cards.shift(n)

  end

  def return(cards)
    @cards += cards 
  end

  def shuffle
    @cards.shuffle!
  end
end

private 

def cards 
  @cards 
end 


