class HumanPlayer
    attr_accessor :previous_guess
    def initialize
        @previous_guess = nil 
    end 


    def prompt
        puts "Please ender the position of the card you'd like to flip (e.g '2,3')"
        puts ">"
        gets.chomp.split(",").map(&:to_i)
    end 

    def received_revealed_card(pos, value)
    end 
    
    def receive_match(pos1, pos2)
        puts "It's a match!"
    end
end     