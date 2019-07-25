
require_relative "player.rb"

class Game 

    attr_accessor :current_player, :fragment, :players, :loses
    attr_reader :dictionary

    def initialize
        puts "How many players?"
        n = gets.chomp.to_i
        @players = []
        n.times do 
            puts "What's your name?"
            @players << Player.new(gets.chomp)
        end 
        @fragment = ""
        @dictionary = ["aardvark",  "abaci", "aback", 
        "abacus", "abaft", "abalone", "abandon", 
        "abandoned", "abandonment", "abase", "abasement"]
        @current_player = @players[0]
        @loses = Hash.new(0)
    end 

    def next_player!
        idx = (@players.index(@current_player) + 1) % @players.length
        @current_player = @players[idx]
    end 

    def valid_play?(letter)
        guess = @fragment + letter
        @dictionary.any? { |word| word.start_with?(guess) }
    end

    def take_turn(player)
        input = player.guess
        until valid_play?(input)
            puts "#{@current_player.name}, please enter a valid letter!"
            input = player.guess
        end
        @fragment += input
        puts "#{@fragment}"
        if @dictionary.include?(@fragment)
            lose(player)
            @fragment = ""
        end
    end

    def lose(player)
        @loses[player.name] += 1
    end
    
    def record(player)
        new_str = ""
        (0..@loses[player.name] - 1).each do |i|
            new_str += "GHOST"[i]
        end
        new_str
    end

    def play_round
        take_turn(@current_player)
        if @loses.has_value?(5)
            @players.delete(@current_player)
            @current_player = @players[0]
        else
            next_player!
        end 
    end

    def run 
        until @players.length == 0 
            puts "---------------------"
            @players.each do |player|
                puts "#{player.name}: #{record(player)}"
            end 
            play_round
        end 
    end 
end
        
