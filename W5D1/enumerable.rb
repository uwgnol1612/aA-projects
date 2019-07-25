require "byebug"

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            self[i] = prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if prc.call(ele)
        end  
        arr 
    end

    def my_reject(&prc)
        arr = []
        self.each do |ele|
            arr << ele if !prc.call(ele)
        end
        arr
    end

    def my_any?(&prc)
        self.each do |ele|
            if prc.call(ele)
                return true  
            end  
        end  
        false 
    end 

    def my_all?(&prc)
        self.each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        true
    end

    def my_flatten
        return [self] if !self.is_a? Array 
        arr = []
        self.each do |ele|
            if ele.is_a? Array 
                arr += ele.my_flatten
            else  
                arr << ele  
            end  
        end 
        arr 
    end

    def my_zip(*arr)
        new_arr = Array.new(self.length) { Array.new }
        self.each_with_index do |el, i|
            new_arr[i] << el
        end
        arr.each do |sub|
            self.each_with_index do |el, i|
                new_arr[i] << sub[i]
            end
        end
        new_arr.each do |sub|
            if sub.length < self.length
                (self.length - sub.length).times { sub << nil }
            end
        end
        new_arr
    end

    def my_rotate(num = 1)
        num.abs.times do 
            if num > 0 
                self.push(self.shift)
            else   
                self.unshift(self.pop)
            end
        end 
        self 
    end   

    def my_join(sep = "")
        str = ""
        self.each_with_index do |char, i|
            str += char + sep if i != self.length - 1
        end
        str
    end

    def my_reverse
        return [] if self.empty?
        new_arr = []
        (self.length - 1).downto(0) do |i|
            new_arr << self[i]
        end
        new_arr
    end
end

 