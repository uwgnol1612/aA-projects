module TieBreaker
  def tie_breaker(other_hand)
    if self.rank == :royal_flush
      cards.first <=> other_hand.cards.first
    elsif self.rank == :straight_flush
      high_card <=> other_hand.high_card
    elsif self.rank == :four_of_a_kind
      current_hand_value = Card.values.find {|value| card_value_count(value) == 4}
      other_hand_value = Card.values.find {|value| other_hand.card_value_count(value) == 4}
      res2 = Card.values.index(current_hand_value) <=> Card.values.index(other_hand_value)
      if res2 == 0
        current_high_card = cards_without(current_hand_value)
        other_high_card = other_hand.cards_without(other_hand_value)
        current_high_card <=> other_high_card
      else  
        res2 
      end 
    elsif self.rank == :two_pair
      
      



  end

  def compare_full_house(other_hand)

  end

  def compare_two_pair(other_hand)

  end

  def high_pair
    pairs[1][1]

  end

  def low_pair
    pairs[0][1]

  end

  def compare_set_then_high_card(n, other_hand)

  end

  protected
  def pairs
    hash = Hash.new {|h, k| h[k] = []}
    sorted_cards.each do |card|
      hash[card.value] << card 
    end 
    hash.sort_by {|k,v| Card.values.index(k)}
  end 

end
