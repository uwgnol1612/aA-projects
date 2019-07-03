require_relative "PolyTreeNode"

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
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(node)
        path = [node]
        until path[-1] == @root_node
            current_parent = path[-1].parent 
            path << current_parent
        end     

        path.map!(&:value).reverse
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

if __FILE__ == $PROGRAM_NAME
    kpf = KnightPathFinder.new([0, 0])
    p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
    p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end     

