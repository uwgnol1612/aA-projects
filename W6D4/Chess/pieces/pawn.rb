require_relative "piece"

class Pawn < Piece 

    def move_dirs
        [forward_dir,0]
    end 

    def moves
        moves = []
        i, j = self.pos 
        forward_steps.each do |step|
            i += step[0] * forward_dir 
            moves << [i,j]
        end
        moves
    end

    def symbol
        "♟".colorize(color)
    end

    def at_start_row?
        self.color == :white && self.pos[0] == 6 || self.color == :black && self.pos[0] == 1
    end 

    def forward_dir #should return 1 or -1
        if self.color == :black 
            return 1
        else
            return -1
        end
    end 

    def forward_steps
        possible_steps = [[1,0], [2,0]] if at_start_row?
        possible_steps = [[1,0]]
    end 

    def side_attacks
        i, j = self.pos
        if self.color == :white
            [[i-1, j-1], [i-1, j+1]]
        else
            [[i+1, j-1], [i+1, j+1]]
        end
    end 

end