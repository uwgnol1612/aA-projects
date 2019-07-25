class Array
    def my_uniq
        prev = []
        self.each do |ele|
            prev << ele unless prev.include?(ele)
        end
        prev
    end

    def two_sum 
        pairs = []
        (0...self.length-1).each do |i|
            (i+1...self.length).each do |j|
                pairs << [i, j] if self[i] + self[j] == 0 
            end   
        end   
        pairs 
    end 

    def my_transpose
        return [] if self.empty?
        array = Array.new(self.first.length) { Array.new(self.length) }
        (0..self.length-1).each do |i|
            (0..self[i].length-1).each do |j|
                array[j][i] = self[i][j]
            end
        end
        array
    end
end

def stock_picker(array)
    profit = 0
    days = []
    (0...array.length-1).each do |i|
        (i+1...array.length).each do |j|
            if (array[j] - array[i]) > profit 
                profit = array[j] - array[i]
                days = [i,j]
            end
        end
    end    
    days 
end 
################TOWERS OF HANOI#############

class TowersOfHanoi
    def initialize
        @left = [4,3,2,1]
        @center = []
        @right = []
    end

    def move
        puts "Please select a starting disc"
        start_input = gets.chomp
        puts "Please select an ending disc"
        end_input
    end

    def won?
        @left.empty? && (@center.length == 4 || @right.length == 4)
    end

    def play
        until won?
            move
        end
    end

end

if __FILE__ == $PROGRAM_NAME

end