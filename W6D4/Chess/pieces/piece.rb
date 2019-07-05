require "colorize"

class Piece 
    attr_reader :color
    attr_accessor :board, :pos
    
    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos 
    end 

    def to_s
        "#{symbol}" 
    end 

    def empty?
    end 

    def valid_moves
        moves.reject { |move| move_into_check?(move)}
    end 

    def pos=(val)
        @pos = val 
    end 

    def symbol
        raise "The symbol is not assigned!"
    end 

    private

    def move_into_check?(end_pos)
        dup_board = @board.dup
        dup_board.move_piece(color,pos,end_pos)
        dup_board.in_check?(color)
    end 
end 

















