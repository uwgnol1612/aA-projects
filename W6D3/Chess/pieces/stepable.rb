module Stepable
    def moves
        possible_pos = []
        move_diffs.each do |dir|
            i, j = self.pos 
            dx, dy = dir
            i += dx
            j += dy
            if self.board.valid_pos?([i,j]) && self.board[[i,j]].color != self.color
                possible_pos << [i,j]
            end
        end 
        possible_pos
    end 

    def move_diffs
        raise "No steps are assigned!"
    end 
    
end