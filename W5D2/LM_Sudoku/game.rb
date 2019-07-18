require_relative "board.rb"

class Game
    attr_accessor :board

    def self.from_file(filename)
        board = Board.from_file(filename)
        self.new(board)
    end 

    def initialize(board)
        @board = board
    end 

    def play 
        until solved?
            board.render
            pos = nil 
            until pos && valid_pos(pos)
                pos = prompt_for_pos
            end 
            value = nil 
            until value && valid_value(value)
                value = prompt_for_value
            end 
            board[pos] = value 
        end 
        puts "Puzzle solved!"
    end 

    def solved?
        board.solved?
    end

    def prompt_for_pos
        puts "Please choose a position you want to fill ex.(2,3)"
        print ">"
        pos = gets.chomp.split(",").map(&:to_i)
        pos 
    end 

    def prompt_for_value
        puts "Please choose value between 1 to 9"
        print ">"
        value = gets.chomp.to_i
        value 
    end 

    def valid_pos(pos)
        pos.length == 2 && pos.all? {|x| x.between?(0,8)}
    end 
    
    def valid_value(val)
        val.between?(1,9)
    end 

end 

game = Game.from_file("sudoku1.txt")
game.play 