require_relative "tile.rb"

class Board
    attr_accessor :grid 

    def self.from_file(filename)
        rows = File.readlines(filename).map(&:chomp)
        tiles = rows.map do |row|
            nums = row.split("").map(&:to_i)
            nums.map {|num| Tile.new(num)}
        end 
        
        self.new(tiles)
    end 

    def initialize(grid)
        @grid = grid
    end 

    def [](pos)
        i, j = pos 
        @grid[i][j]
    end 

    def []=(pos, value)
        i, j = pos 
        tile = @grid[i][j]
        tile.value = value 
    end 

    def render
        puts "  #{(0..8).to_a.join(" ")}".colorize(:red) 
        @grid.each_with_index do |row, idx|
            puts "#{idx}".colorize(:red) + " #{row.join(" ")}"
        end 
    end 

    def solved?
        rows.all? {|row| solved_set?(row)} &&
        columns.all? {|col| solved_set?(col)} &&
        squares.all? {|square| solved_set?(square)}
    end 

    def solved_set?(tiles)
        nums = tiles.map {|tile|tile.value}
        nums.sort == (1..9).to_a 
    end 

    def rows 
        @grid 
    end 

    def columns
        rows.transpose 
    end 

    def square(idx)
        tiles = []
        x = (idx / 3)*3
        y = (idx % 3)*3
        (x...x+3).each do |i|
            (y...y+3).each do |j|
                tiles << self[[i,j]]
            end 
        end
        tiles  
    end 

    def squares 
        (0..8).to_a.map {|i| square(i)}
    end 

            

end 