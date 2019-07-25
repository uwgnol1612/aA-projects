require_relative "card.rb"

class Board

    attr_reader :size

    def initialize(size) 
        @grid = Array.new(size) {Array.new(size)}
        @size = size
        populate 
    end 

    def populate
        num_pair = size * size / 2 
        cards = Card.shuffled_pairs(num_pair)
        
       (0..@grid.length - 1).each do |row|
            (0..@grid[row].length - 1).each do |col|
                @grid[row][col] = cards.pop
            end  
        end
    end  

    def [](pos)
        i, j = pos 
        @grid[i][j]
    end 

    def []=(pos, value)
        i, j = pos
        @grid[i][j] = value 
    end 

    def render
        system("clear")
        puts "  " + (0..@size-1).to_a.join(" ")
        @grid.each_with_index do |row, idx|
            new_row = row.map {|card| card.revealed? ? card.face_value : " "}
            puts "#{idx} #{new_row.join(" ")}"
        end
    end  

    def won?
        @grid.flatten.all? {|card| card.revealed?} 
    end 


    def reveal(pos)
        if self[pos].revealed?
            puts "That card has been fliped!"
        else  
            self[pos].reveal
        end 
        self[pos].face_value 

    end 

end 