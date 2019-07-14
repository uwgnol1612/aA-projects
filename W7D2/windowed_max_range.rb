# Phase 1: Naive solution O(n)


def windowed_max_range(array, w)
    cur_max_range = nil
    array.each_with_index do |ele, i|
        diff = array[i, w].max - array[i, w].min
        cur_max_range = diff if cur_max_range.nil? || diff > cur_max_range
    end 
    cur_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


# Phase 2:

class MyQueue
    def initialize
        @store = []     
    end
    
    def size
        @store.length
    end 

    def empty?
        @store.empty?
    end 

    def enqueue(ele)
        @store.push(ele)
    end 

    def dequeue
        @store.shift
    end 

    def peek 
        @store.first
    end 
end 

# Phase 3:
class MyStack
    def initialize
        @store = []
    end 

     def size
        @store.length
    end 

    def empty?
        @store.empty?
    end 

    def enqueue(ele)
        @store.push(ele)
    end 

    def dequeue
        @store.pop
    end 

    def peek 
        @store.last
    end  
end

# Phase 4:
class StackQueue

    def initialize
        @in_stack = []
        @out_stack = []
    end 

    def size 
        @in_stack.length + @out_stack.length 
    end 

    def empty?
        @in_stack.empty? && @out_stack.empty?
    end 

    def enqueue(ele)
        @in_stack.push(ele)

    end 

    def dequeue
        transfer if @out_stack.empty?
        @out_stack.pop 

    end 

    def transfer
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end 

end 

# Phase 5:

class MinMaxStack

    def initialize
        @store = MyStack.new
    end 

    def size 
        @store.size
    end 

    def empty?
        @store.empty?
    end 

    def peek
        @store.peek[:value] unless empty?
    end
    
    def min
        @store.peek[:min] unless empty? 
    end 

    def max 
        @store.peek[:max] unless empty? 
    end 

    def push(ele)
        @store.enqueue({
            value: ele,  
            max: new_max_value(ele),
            min: new_min_value(ele)
    })
    end 

    def pop 
        @store.dequeue[:value] unless empty? 
    end 

    def new_max_value(ele)
        empty? ? ele : [max, ele].max 
    end 

    def new_min_value(ele)
        empty? ? ele : [min, ele].min 
    end 

end 

#P Phase 6:

class MinMaxStackQueue

    def initialize
        @in_stack = MinMaxStack.new
        @out_stack = MinMaxStack.new
    end 

    def size 
        @in_stack.size + @out_stack.size 
    end 

    def empty?
        @in_stack.empty? && @out_stack.empty?
    end 

    def enqueue(ele)
        @in_stack.push(ele)

    end 

    def dequeue
        transfer if @out_stack.empty?
        @out_stack.pop 

    end 

    def max 
        max_num = []
        max_num << @in_stack.max unless @in_stack.empty?
        max_num << @out_stack.max unless @out_stack.empty?
        max_num.max
    end 

    def min
        min_num = []
        min_num << @in_stack.min unless @in_stack.empty?
        min_num << @out_stack.min unless @out_stack.empty?
        min_num.min 
    end 

    def transfer
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end 
    
end 

# Phase 7:



def windowed_max_range(array, w)
    cur_max_range = nil 
    queue = MinMaxStackQueue.new
    
    array.each_with_index do |el, i|
        queue.enqueue(el)
        queue.dequeue if queue.size > w

        if queue.size == w
            if cur_max_range.nil? || queue.max - queue.min > cur_max_range
                cur_max_range = queue.max - queue.min
            end 
        end  
    end 
    cur_max_range 
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4  # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5  # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6  # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6  # 3, 2, 5, 4, 8






