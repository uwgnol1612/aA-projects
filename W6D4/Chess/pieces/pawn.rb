require_relative "piece"

class Pawn < Piece 

    def moves
        forward_steps + side_attacks
    end

    def symbol
        "♟".colorize(color)
    end

    def at_start_row?
        self.color == :white && self.pos[0] == 6 || self.color == :black && self.pos[0] == 1
    end 

    def forward_dir #should return 1 or -1
        self.color == :black ? 1 : -1
    end 

    def forward_steps
        i, j = pos
        one_step = [i + forward_dir, j]
        return [] unless board.valid_pos?(one_step) && board.empty?(one_step)

        steps = [one_step]
        two_step = [i + 2 * forward_dir, j]
        steps << two_step if at_start_row? && board.empty?(two_step)
        steps
    end 

    def side_attacks
        i, j = self.pos
        side_moves = [[i + forward_dir, j - 1], [i + forward_dir, j + 1]]

        side_moves.select do |new_pos|
            next if !self.board.valid_pos?(new_pos)
            next if self.board[new_pos].empty?

            other_piece = self.board[new_pos]
            other_piece && self.color != other_piece.color 
        end 
    end 

end