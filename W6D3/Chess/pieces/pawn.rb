require_relative "piece"

class Pawn < Piece 

    def move_dirs

    end 

    def symbol
        "♟".colorize(color)
    end
    
    private 

    def at_start_row?
        self.color == :white && self.pos[0] == 6 || self.color == :black && self.pos[0] == 1
    end 

    def forward_dir #should return 1 or -1

    end 

    def forward_steps
        possible_steps = [1,2] if at_start_row?
        possible_steps = 1
    end 

    def side_attacks
    end 

end