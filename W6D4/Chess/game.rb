require_relative "board"
require_relative "display"
require_relative "player"



class Game 
    def initialize
        @board = Board.new
        @display = Display.new(@board) 
        @player1 = ComputerPlayer.new(:white, @display)
        @player2 = ComputerPlayer.new(:black, @display)
        @current_player = @player1
    end
    
    def play
        until @board.checkmate?(@current_player.color)
            begin 
                start_pos, end_pos = @current_player.make_move(@board)
                @board.move_piece(@current_player.color, start_pos, end_pos)
                
                swap_turn!
                notify_players
            rescue StandardError => e 
                @display.messages[:error] = e.message
                retry 
            end 
        end 

        @display.render
        puts "#{@current_player.color} is checkmated."

    end 

    def notify_players
        if @board.in_check?(@current_player.color)
            @display.set_check!
        else
            @display.uncheck!
        end 
    end


    def swap_turn!
        @current_player = @current_player == @player1 ? @player2 : @player1
    end 
end



game = Game.new 
game.play

