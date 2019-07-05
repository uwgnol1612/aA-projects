require_relative "board"
require_relative "display"
require_relative "player"



class Game 
    def initialize
        @board = Board.new
        @display = Display.new(@board) 
        @player1 = HumanPlayer.new(:white, @display)
        @player2 = HumanPlayer.new(:black, @display)
        @current_player = @player1
    end
    
    def play
        until @board.checkmate?(@current_player.color)
            start_pos, end_pos = @current_player.make_move
            @board.move_piece(@current_player.color,start_pos,end_pos)
            swap_turn!
        end 
    end 

    def notify_players

    end 
    

    def swap_turn!
        @current_player = @current_player == @player1 ? @player2 : @player1
    end 
end 

game = Game.new 
game.play