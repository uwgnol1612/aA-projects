class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1 
    @game_over = false 
    @seq = []
  end

  def play
    until game_over
      take_turn
    end 
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    system("clear")
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end 
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts "#{color}"
      sleep(1)
    end  
  end

  def require_sequence
    puts "Please repeat the sequence, seperated by space, e.g (red blue)"
    input = gets.chomp
    res = []
    input.split(" ").each do |color|
      res << color 
    end 
    if res != @seq
      @game_over = true 
    end 

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Congratulations! You completed this round!"

  end

  def game_over_message
    puts "Sorry, game over!"

  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end
end

game = Simon.new
game.play
