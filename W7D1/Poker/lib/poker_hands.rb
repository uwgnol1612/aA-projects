require_relative './tie_breaker'

module PokerHands
  include TieBreaker

  RANKS = [
    :royal_flush,
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]

  def rank
    RANKS.each do |rank|
      return rank if self.send("#{rank}?")
    end 

  end

  def <=>(other_hand)
    res = RANKS.index(other_hand.rank) <=> RANKS.index(rank)
    if res == 0 
      tie_breaker(other_hand)
    else  
      res 
    end 

  end


  protected
  def card_value_count(value)
    counter = 0
    cards.each do |card|
      counter += 1 if card.value == value
    end
    counter 
  end

  def high_card
    cards = sort!
    cards.last
  end

  def cards_without(value)
    cards.select {|card| card.value != value}
  end

  def has_a?(value_or_suit)
    cards.any? {|card| card.value == value_or_suit || card.suit == value_or_suit }
  end

  def royal?
    Card.royal_values.all? {|value|has_a?(value)}

  end

  def set_card(n)

  end

  private
  def royal_flush?
    royal? && straight_flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    Card.values.any? {|value| card_value_count(value) == 4}
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    suit = []
    cards.each do |card|
      suit << card.suit 
    end 
    suit.uniq.length == 1 
  end

  def straight?
    sorted_cards = sort!
    values = []
    sorted_cards.each do |card|
      values << card.value
    end 

    if has_a?(:ace)
      return true if values == [:ten, :jack, :queen, :king, :ace] || [:two, :three, :four, :five, :ace]
    else
      start_index = Card.values.index(values.first)
      if start_index > 7
        return false 
      else
        card_values = []
        (start_index..start_index + 4).each do |i|
          card_values << Card.values[i]
        end 
        return true if card_values == values 
      end 
    end 
    return false 
    
  end

  def three_of_a_kind?
    Card.values.any? {|value| card_value_count(value) == 3}
  end

  def two_pair?
    pairs.count == 2
  end

  def one_pair?
    pairs.count == 1
  end

  def high_card?
    true
  end
end
