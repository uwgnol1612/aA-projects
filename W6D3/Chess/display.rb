require "colorize"
require_relative "board"
require_relative "cursor"

class Display
    def initialize(board)
        @board = board
        @cursor_pos = [0,0]
        @cursor = Cursor.new(@cursor_pos,@board)
    end


    def render
        new_board = @board.rows.map.with_index do |row, i|
            row.map.with_index do |el, j|
                
                if (i.even? && j.odd? || i.odd? && j.even?) && @cursor_pos != [i,j]
                   " #{el.to_s}  ".colorize(:background => :red)
                elsif @cursor_pos == [i,j]
                    " #{el.to_s}  ".colorize(:background => :green)
                else
                   " #{el.to_s}  ".colorize(:background => :blue)
                end 
            end 
        end 
        # new_board[@cursor_pos] = " #{new_board[@cursor_pos].to_s}  ".colorize(:background => :green)
        new_board.each do |row|
            puts row.join
        end   
    end

    # def make_mov
    #     start_pos = 
    #     until @cursor.cursor_pos
    #         render
    #     end
    # end

end

