require "byebug"

module Slideable
    def horizontal_dirs
        HORIZONTAL_DIRS
    end 

    def diagonal_dirs
        DIAGONAL_DIRS 
    end 

    def moves
        possible_pos = []
        move_dirs.each do |dir| 
            dx,dy = dir
            possible_pos += grow_unblocked_moved_in_dir(dx,dy)
        end 
        possible_pos
    end 

    private 
    HORIZONTAL_DIRS = [[0, 1], [0,-1], [1, 0], [-1, 0]]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

    def move_dirs
        raise "Moving directions is not specified!"
    end 

    def grow_unblocked_moved_in_dir(dx, dy)
        i, j = self.pos
        moves = []

        while self.board.valid_pos?([i,j])
            i += dx
            j += dy
            if self.board.valid_pos?([i,j]) && self.board[[i,j]].color != self.color
                moves << [i,j]
            end 
        end
        moves
    end 

end

