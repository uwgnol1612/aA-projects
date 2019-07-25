class PolyTreeNode
    attr_reader :parent, :children, :value 

    def initialize(value)
        @value = value 
        @parent = nil 
        @children = []
    end 

    def parent=(node)
        # node is already the parent
        return if self.parent == node 

        # current parent exists 
        old_parent = self.parent
        if !old_parent.nil? 
            old_parent.children.delete(self)
        end 

        # assigning a new parent
        new_parent = node 
        @parent = new_parent
        new_parent.children << self if !new_parent.nil?   
    end 

    def add_child(child)
        child.parent = self 
    end 

    def remove_child(child)
        child.parent = nil
        if !self.children.include?(child)
            raise "Can't do it if the node is not a child!"
        end 
    end 

    def dfs(target)
        return self if self.value == target 

        children.each do |child|
            result = child.dfs(target)
            return result if !result.nil?
        end         
        
        nil
    end  
    
    def bfs(target)
        queue = [self]
        while !queue.empty?
            node = queue.shift
            return node if node.value == target
            queue += node.children
        end 
        nil 
    end  

end



