require_relative 'poker_hands'

class Hand
  include PokerHands

  attr_reader :cards

  def initialize(cards)
    @cards = cards 
    raise 'must have five cards' unless @cards.length == 5
  end

  def self.winner(hands)

  end 


  def trade_cards(old_cards, new_cards)
    take_cards(new_cards)
    discard_cards(old_cards)
    raise 'must have five cards' unless @cards.count == 5
  end

  def to_s

  end

  def sort!
    cards.sort_by {|card| Card.values.index(card.value)}
  end

  def take_cards(cards)
    @cards += cards 
  end

  def discard_cards(old_cards)
    raise 'cannot discard unowned card' unless has_cards?(old_cards) 
    @cards -= old_cards
  end

  def has_cards?(old_cards)
    old_cards.each do |card|
      return false unless @cards.include?(card)
    end 
    true 
  end
end
