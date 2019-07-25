require "colorize"
require_relative "cursor"

class Display
    attr_accessor :cursor, :board, :messages
    
    def initialize(board)
        @board = board
        @cursor_pos = [0,0]
        @cursor = Cursor.new(@cursor_pos, @board)
        @messages = {}
    end


    def render
        system("clear")
    
        puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
        new_board = @board.rows.map.with_index do |row, i|
            row.map.with_index do |piece, j|
                
                if  @cursor.cursor_pos == [i,j] && @cursor.selected
                   " #{piece.to_s}  ".colorize(:background => :green)
                elsif @cursor.cursor_pos == [i,j]
                    " #{piece.to_s}  ".colorize(:background => :cyan)
                elsif i.even? && j.odd? || i.odd? && j.even?
                   " #{piece.to_s}  ".colorize(:background => :red)
                else
                    " #{piece.to_s}  ".colorize(:background => :blue)  
                end 
            end 
        end 
        
        new_board.each do |row|
            puts row.join
        end 

        @messages.each do |key, val|
            puts val
        end 
    end


    def reset!
        @messages.delete(:error)
    end

    def uncheck!
        @messages.delete(:check)
    end

    def set_check!
        @messages[:check] = "Check!"
    end 




end 

