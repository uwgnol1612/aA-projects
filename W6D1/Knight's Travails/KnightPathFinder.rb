require_relative "PolyTreeNode"
#require "colorize"

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree
    end   

    def build_move_tree
        queue = [@root_node]  
        until queue.empty?
            first = queue.shift 
            new_positions = new_move_positions(first.value)
            new_positions.each {|pos| first.add_child(PolyTreeNode.new(pos))}
            
            queue += first.children
        end             
    end     

    # def display
    #     hash = Hash.new { |h, k| h[k] = [] }
    #     hash[@root_node] = []

    #     while !queue.empty?
    #         node = queue.shift
    #         puts node.value
    #         queue += node.children
    #     end  
    # end 
    
    def find_path(end_pos)
    end

    def new_move_positions(pos)
        positions = KnightPathFinder.valid_moves(pos)
        new_positions = positions.select {|each_pos| !@considered_positions.include?(each_pos)}
        @considered_positions += new_positions 
        new_positions
    end 

    def self.valid_moves(pos)
        i, j = pos 
        possible = [[i-1, j+2], [i-2, j+1], [i-2, j-1], [i-1, j-2], [i+1, j-2], [i+2, j-1], [i+2, j+1], [i+1, j+2]]
        possible.select {|pair| pair.all? {|x| x.between?(0,7)}}
    end 
end     

# knight = KnightPathFinder.new([1, 1])
# p knight

