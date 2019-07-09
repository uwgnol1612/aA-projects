require "colorize"

class Piece 
    attr_reader :color
    attr_accessor :board, :pos
    
    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos 

        @board.add_piece(pos, self)
    end 

    def to_s
        "#{symbol}" 
    end 

    def empty?
        false 
    end 

    def valid_moves
        moves.reject {|pos| move_into_check?(pos)}
    end 

    def pos=(val)
        @pos = val 
    end 

    def symbol
        raise "The symbol is not assigned!"
    end 

    def move_into_check?(end_pos)
        dup_board = @board.dup
        dup_board.move_piece!(pos, end_pos)
        dup_board.in_check?(color)
    end 
end 

















