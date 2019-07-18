require_relative "board"
require_relative "human_player.rb"
require_relative "card.rb"
require_relative "computer_player.rb"



class Game
    attr_accessor :player, :previous_guess

    def initialize(player, size = 4)
        @board = Board.new(size) 
        @player = player 
        @previous_guess = nil
    end
    
    def play 
        until over?
            @board.render
            guessed_pos = get_input
            make_guess(guessed_pos)
        end 
    end
    
    def make_guess(pos)
        value = @board.reveal(pos)
        player.received_revealed_card(pos, value)
        @board.render

        if previous_guess.nil?    
            self.previous_guess = pos
            player.previous_guess = pos  
        else   
            if @board[pos] == @board[previous_guess]
                player.receive_match(previous_guess, pos)
            else
                puts "Try again!"
                @board[pos].hide
                @board[previous_guess].hide
            end
            self.previous_guess = nil
            player.previous_guess = nil  
        end 

        sleep(1)
        @board.render
    end  

    def get_input
        pos = nil 
        until pos && valid_pos(pos)
            pos = @player.prompt
        end 
        pos
    end 

    def valid_pos(pos)
        pos.is_a?(Array) && pos.length == 2 && pos.all? {|x| x.between?(0, @board.size-1)}
    end 
    
    def over?
        @board.won?
    end 

    game = Game.new(HumanPlayer.new) 
    game.play


end