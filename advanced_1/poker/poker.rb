class Poker

  CARD_VALUES = { 'A' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                  '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11,
                  'Q' => 12, 'K' => 13 }

  def initialize(hands=[])
    @hands = hands
  end

  def best_hand
    return [@hands.first] if @hands.size == 1
    if @hands.any? {|hand| straight_flush?(hand)}
      straight_flushes = @hands.select{|hand| straight_flush?(hand)}
      if straight_flushes.size == 1
        return straight_flushes
      else
        max = 0
        straight_flushes.each { |hand| max = straight_flush(hand) if straight_flush(hand) > max}
        return straight_flushes.select{ |hand| straight_flush(hand) == max}
      end
    end
    if @hands.any? {|hand| four_of_a_kind?(hand)}
      return [@hands.select{|hand| four_of_a_kind?(hand)}.
             sort_by { |hand| four_of_a_kind(hand)}.last]
    end
    if @hands.any? {|hand| full_house?(hand)}
      return [@hands.select{|hand| full_house?(hand)}.
             sort_by { |hand| full_house(hand)}.last]
    end
    if @hands.any? {|hand| flush?(hand)}
      flushes = @hands.select{|hand| flush?(hand)}
      if flushes.size == 1
        return flushes
      else
        max = 0
        flushes.each { |hand| max = flush(hand) if flush(hand) > max}
        return flushes.select{ |hand| flush(hand) == max}
      end
    end
    if @hands.any? {|hand| straight?(hand)}
      straights = @hands.select{|hand| straight?(hand)}
      if straights.size == 1
        return straights
      else
        max = 0
        straights.each { |hand| max = straight(hand) if straight(hand) > max}
        return straights.select{ |hand| straight(hand) == max}
      end
    end
    if @hands.any? {|hand| three_of_a_kind?(hand)}
      return [@hands.select{|hand| three_of_a_kind?(hand)}.
             sort_by { |hand| three_of_a_kind(hand)}.last]
    end
    if @hands.any? {|hand| two_pair?(hand)}
      return [@hands.select{|hand| two_pair?(hand)}.
             sort_by { |hand| two_pair(hand)}.last]
    end
    if @hands.any? {|hand| one_pair?(hand)}
      return [@hands.select{|hand| one_pair?(hand)}.
             sort_by { |hand| one_pair(hand)}.last]
    end
    [@hands.sort_by { |hand| high_card(hand)}.last]

  end

  def straight_flush(hand)
    if straight?(hand) && flush?(hand)
      return straight(hand)
    else
      nil
    end
  end

  def straight_flush?(hand)
    !!straight_flush(hand)
  end

  def four_of_a_kind(hand)
    hand_values = hand.map{ |card| card[0]}
    hand.each do |card|
      return card[0] if hand_values.count(card[0]) == 4
    end
    nil
  end

  def four_of_a_kind?(hand)
    !!four_of_a_kind(hand)
  end

  def full_house(hand)
    pair = []
    if one_pair(hand)
      pair << one_pair(hand)
      hand = (hand.select { |card| card[0] != pair[0].to_s[0]})
      return CARD_VALUES[hand[0][0]] if hand.all? { |card| card[0] == hand[0][0] }
    end
    nil
  end

  def full_house?(hand)
    !!full_house(hand)
  end

  def flush(hand)
    if hand.all? {|card| card[-1] == hand[0][-1]}
      CARD_VALUES[hand.sort_by {|card| CARD_VALUES[card[0]]}.last[0]]
    else
      nil
    end
  end

  def flush?(hand)
    !!flush(hand)
  end

  def straight(hand)
    hand = hand.map{|card| CARD_VALUES[card[0]]}.sort
    return hand[-1] if hand.uniq == hand && (hand[0] + 4) == hand[-1]
    nil
  end

  def straight?(hand)
    !!straight(hand)
  end

  def three_of_a_kind(hand)
    hand_values = hand.map{ |card| card[0]}
    hand.each do |card|
      return card[0] if hand_values.count(card[0]) == 3
    end
    nil
  end

  def three_of_a_kind?(hand)
    !!three_of_a_kind(hand)
  end

  def two_pair(hand)
    pairs = []
    if one_pair(hand)
      pairs << one_pair(hand)
      if one_pair(hand.select { |card| card[0] != pairs[0].to_s})
        pairs << one_pair(hand.select { |card| card[0] != pairs[0].to_s})
        return pairs.sort.last
      end
    end
    nil
  end

  def two_pair?(hand)
    !!two_pair(hand)
  end

  def one_pair(hand)
    hand_values = hand.map{ |card| card[0]}
    hand.each do |card|
      return CARD_VALUES[card[0]] if hand_values.count(card[0]) == 2
    end
    nil
  end

  def one_pair?(hand)
    !!one_pair(hand)
  end

  def high_card(hand)
    CARD_VALUES[hand.sort_by { |card| CARD_VALUES[card[0]]}.last[0]]
  end
end
