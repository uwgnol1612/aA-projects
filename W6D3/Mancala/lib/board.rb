class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @player1 = name1 
    @player2 = name2 
    place_stones
  end

  def place_stones
    (0..5).each do |i|
      4.times {@cups[i] << :stone}
    end 
    (7..12).each do |j|
      4.times {@cups[j] << :stone}
    end 
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,5) && !start_pos.between?(7,12)
      raise "Invalid starting cup"
    end  
    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end 
  end

  def make_move(start_pos, current_player_name)
    count = @cups[start_pos].count 
    i = start_pos
    if current_player_name == @player1
      until count == 0
        i += 1
        i -= 14 if i > 13
        if i != 13
          @cups[i] << :stone  
          count -= 1
        end  
      end
    else
      until count == 0
        i += 1
        i -= 14 if i > 13
        if i != 6 
          @cups[i] << :stone  
          count -= 1
        end  
      end
    end
    
    ending_cup_index = i
    @cups[start_pos] = []
    render 
    next_turn(ending_cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].count == 1 && !(ending_cup_idx == 6 || ending_cup_idx == 13)
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    else  
      return ending_cup_idx
    end 
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? {|i| @cups[i].empty?} || (7..12).all? {|i| @cups[i].empty?}
  end

  def winner
    return :draw if @cups[6].count == @cups[13].count
    winner = @cups[6].count > @cups[13].count ? "#{@player1}" : "#{@player2}"
  end
end
