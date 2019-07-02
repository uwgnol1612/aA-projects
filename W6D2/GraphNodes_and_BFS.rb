
require 'set'

class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = [] 
    end 
end 

# a = GraphNode.new('a')
# b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# a.neighbors = [b, c, e]
# b.neighbors = []
# c.neighbors = [b, d]
# d.neighbors = []
# e.neighbors = [a]
# f.neighbors = [e]


def bfs(starting_node, target_value)
    visited = Set.new()
    queue = [starting_node]
    until queue.empty?
        first = queue.shift
        visited.add(first.value)
        if first.value == target_value 
            return first
        else  
            queue += first.neighbors.select {|ele| !visited.include?(ele.value)}
        end 
    end
    return nil 
end







