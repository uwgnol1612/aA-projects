require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board 
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end 

  def losing_node?(evaluator) # evaluator is the mark of the super comp; evaluater is the player
    return true if board.over? && board.winner != evaluator && !board.tied?
    return false if board.over? && (board.winner.nil? || board.winner == evaluator)

    # if evaluator is playing
    if @next_mover_mark == evaluator 
      self.children.all? { |child| child.losing_node?(evaluator) } # if it's a losing node for all the children 
    else  # the opponenet is playing
      self.children.any? { |child| child.losing_node?(evaluator) }
    end     
  end

  def winning_node?(evaluator)
    return true if board.over? && board.winner == evaluator && !board.tied?
    return false if board.over? && (board.winner.nil? || board.winner != evaluator)

    # if evaluator is playing
    if @next_mover_mark == evaluator 
      self.children.any? { |child| child.winning_node?(evaluator) } 
    else  # the opponenet is playing
      self.children.all? { |child| child.winning_node?(evaluator) }
    end 
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty = []
    (0..2).each do |i|
      (0..2).each do |j|
        empty << [i,j] if @board.empty?([i,j])
      end 
    end 

    childs = []
    empty.each do |pos|
      board = @board.dup 
      board[pos] = @next_mover_mark 
      childs << TicTacToeNode.new(board, next_mark, pos)
    end   
      
    childs
  end

  def next_mark 
    (@next_mover_mark == :x)? :o : :x
  end  
end
