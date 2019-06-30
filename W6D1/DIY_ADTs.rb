class Stack
    def initialize
        @stack = []
    end 

    def push(el)
        @stack.push(el)
    end 

    def pop
        @stack.pop 
    end 

    def peek 
        @stack.last 
    end 
end 

class Queue
    def initialize
        @queue = [] 
    end 
    
    def enqueue(el)
        @queue.unshift(el)
    end 

    def dequeue 
        @queue.shift 
    end 

    def peek
        @queue.first 
    end 

end 

class Map 

    def initialize 
        @map = []
    end 

    def set(key, value)
        if get(key) == nil
            @map << [key, value]
        else  
            @map.each do |pair|
                if pair[0] == key 
                    pair[1] = value 
                end 
            end 
        end 
    end 

    def get(key)
        @map.each do |pair|
            if pair[0] == key 
                return pair[1]
            end 
        end
        return nil  
    end 

    def delete(key)
        @map.each do |pair|
            if pair[0] == key 
                @map.delete(pair)
            end  
        end  
    end 

    def show 
        @map 
    end 



end 