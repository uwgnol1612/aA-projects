require "colorize"
require_relative "cursor"

class Display
    attr_accessor :cursor, :board
    
    def initialize(board)
        @board = board
        @cursor_pos = [0,0]
        @cursor = Cursor.new(@cursor_pos, @board)
    end


    def render
        system("clear")
        new_board = @board.rows.map.with_index do |row, i|
            row.map.with_index do |el, j|
                
                if  @cursor.cursor_pos == [i,j] && @cursor.selected
                   " #{el.to_s}  ".colorize(:background => :green)
                elsif @cursor.cursor_pos == [i,j]
                    " #{el.to_s}  ".colorize(:background => :cyan)
                elsif i.even? && j.odd? || i.odd? && j.even?
                   " #{el.to_s}  ".colorize(:background => :red)
                else
                    " #{el.to_s}  ".colorize(:background => :blue)  
                end 
            end 
        end 
        
        new_board.each do |row|
            puts row.join
        end   
    end

end 

