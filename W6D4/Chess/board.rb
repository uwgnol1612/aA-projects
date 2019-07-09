require_relative 'pieces'

class Board 
    attr_reader :rows

    def initialize(fill_empty = true)
        fill_the_board(fill_empty) 
    end 

    
    def move_piece(color, start_pos, end_pos)

        raise "That place is not valid!" if empty?(start_pos) 

        piece = self[start_pos]
            
        if !piece.moves.include?(end_pos)
            raise "#{piece.class} don't move like that!"
        elsif !piece.valid_moves.include?(end_pos)
            raise "That move will lead to #{color} in check!"
        elsif piece.color != color 
            raise "You must move the pieces on #{color} side!"
        end 
        
        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        raise 'piece cannot move like that' unless piece.moves.include?(end_pos)

        self[end_pos] = piece 
        self[start_pos] = NullPiece.instance
        piece.pos = end_pos
        nil  
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
        raise "position not empty" unless empty?(pos)
        self[pos] = piece 
    end 

    def empty?(pos)
        self[pos].empty?
    end

    def valid_pos?(pos)
        pos.all? {|x| x.between?(0,7)}
    end 

    def checkmate?(color)
        return false unless in_check?(color)
        
        pieces.select {|piece| piece.color == color}.all? do |piece|
            piece.valid_moves.empty?
        end  
    end 


    def in_check?(color)
        king_pos = find_king(color)
        pieces.any? {|piece| piece.color != color && piece.moves.include?(king_pos)}
    end 

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def dup
        new_board = Board.new(false)

        pieces.each do |piece|
            piece.class.new(piece.color, new_board, piece.pos)
        end 
        new_board
    end
    

    def fill_the_board(fill_empty)
        @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
        return unless fill_empty   
        [:white, :black].each do |color|
            fill_first_row(color)
            fill_pawns(color)
        end 
    end

    def find_king(color)
        king_pos = []
        pieces.each do |piece|
            if piece.color == color && piece.class == King 
                king_pos = piece.pos 
            end 
        end  
        raise "King not found" if king_pos.empty? 
        king_pos
    end 



    private 

    def fill_first_row(color)
        chars = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        i = color == :white ? 7 : 0
        (0..@rows[i].length-1).each do |j|
            pos = [i,j]
            chars[j].new(color, self, pos)
        end 
    end 

    def fill_pawns(color)
        i = color == :white ? 6 : 1
        (0..@rows[i].length-1).each do |j|
            pos = [i,j]
            Pawn.new(color, self, pos)
        end 
    end 

    

end 




