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

        self[start_pos].pos = end_pos
        self[end_pos].pos = start_pos
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
        pos.all? {|x| x.between?(0,7)}
        
    end 

    def checkmate?(color)
        in_check?(color) && @rows.flatten.none? {|el| el.color == color && el.valid_moves.empty?}
    end 

    def in_check?(color)
        king_pos = find_king(color)
        rival_color = color == :black ? :white : :black
        @rows.flatten.each do |el| 
            if el.color == rival_color && el.is_a?(Pawn) && el.side_attacks.include?(king_pos)
                return true
            end
            if el.color == rival_color && !el.is_a?(Pawn) && el.moves.include?(king_pos)
                return true
            end
        end
        return false
    end 

    def find_king(color)
        @rows.each_with_index do |row,i|
            row.each_with_index do |el,j|
                return [i,j] if el.color == color && el.is_a?(King)
            end
        end

    end 

    def board_dup 
        @rows.deep_dup
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

class Array
    def deep_dup
        self.map do |el|
            if el.is_a? Array
                el.deep_dup
            else
                el
            end
        end
    end
end


