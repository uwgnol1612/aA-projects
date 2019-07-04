require_relative 'pieces'

class Board 
    attr_reader :rows

    def initialize 
        @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
        [:white, :black].each do |color|
            fill_first_row(color)
            fill_pawns(color)
        end  
    end 

    
    def move_piece(color, start_pos, end_pos)
        if self[start_pos].empty? || color == self[end_pos].color 
            raise "That place is not valid"
        end
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    def [](pos)
        row, col = pos 
        @rows[row][col]
    end 
    
    def []=(pos, val)
        row, col = pos 
        @rows[row][col] = val
    end 

    def add_piece(pos, piece)
        self[pos] = piece 
    end 

    def valid_pos?(pos)
        
    end 

    def checkmate?(color)
    end 

    def in_check?(color)
    end 

    def find_king(color)
    end 

    def dup 
    end 

    def pieces
    end 

    def move_piece!(color, start_pos, end_pos)
    end 

    private 

    def fill_first_row(color)
        chars = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        i = color == :white ? 7 : 0
        (0..@rows[i].length-1).each do |j|
            pos = [i,j]
            add_piece(pos, chars[j].new(color, self, pos))
        end 
    end 

    def fill_pawns(color)
        i = color == :white ? 6 : 1
        (0..@rows[i].length-1).each do |j|
            pos = [i,j]
            add_piece(pos, Pawn.new(color, self, pos))
        end 
    end 

end 