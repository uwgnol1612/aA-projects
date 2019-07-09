require_relative "display"

class Player
    attr_reader :color
    def initialize(color, display)
        @color = color 
        @display = display 
    end 
end

class HumanPlayer < Player
    def make_move(_board)
        start_pos, end_pos = nil, nil 
        until start_pos && end_pos
            @display.render
            if start_pos
                puts "#{color}'s turn! Move to where?"
                end_pos = @display.cursor.get_input
                @display.reset! if end_pos
            else  
                puts "#{color}'s turn! Move from where?"
                start_pos = @display.cursor.get_input
                @display.reset! if start_pos
            end 
        end
        
        [start_pos, end_pos]
    end  
end 

class ComputerPlayer < Player
    def make_move(_board)
        @display.render
        sleep(0.5)
        start_pos, end_pos = nil, nil 
        all_start_pos = []
        _board.pieces.each do |piece|
            all_start_pos << piece.pos if piece.color == color 
        end 
        all_start_pos.each do |pos|
            _board[pos].valid_moves.each do |move|
                if _board[move].color != color
                    start_pos = pos  
                    end_pos = move
                end
            end  
        end 
        if start_pos.nil?
            start_pos = all_start_pos.sample 
        end 
        if end_pos.nil? 
            end_pos = _board[start_pos].valid_moves.sample 
        end  
        [start_pos, end_pos]
    end 
end 