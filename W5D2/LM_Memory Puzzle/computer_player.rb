class ComputerPlayer

    attr_accessor :board_size, :previous_guess

    def initialize(size)
        @board_size = size 
        @known_cards = {}
        @matched_cards = {}
        @previous_guess = nil 
    end 

    def received_revealed_card(pos, value)
        @known_cards[pos] = value 
    end 
    
    def receive_match(pos1, pos2)
        @matched_cards[pos1] = true 
        @mathced_cards[pos2] = true 
    end

    def unmatched_pos
        (pos, _) = @known_cards.find do |pos, val|
            @known_cards.any? do |pos2, val2|
            (pos != pos2 && val == val2) && !(@matched_cards[pos] || @matched_cards[pos2])
            end
        end 
        pos  

    end 

    def match_previous
        (pos, _) = @known_cards.find do |pos, val|
            pos != previous_guess && val == @known_cards[previous_guess] && !@match_cards[pos]
        end 
        pos 
    end 


    def prompt
        if previous_guess
            second_guess
        else  
            first_guess 
        end 
    end 

    def first_guess
        unmatched_pos || random_guess 
    end 

    def second_guess 
        match_previous || random_guess
    end 

    def random_guess
        guess = nil 

        until guess && !@known_cards[guess]
            guess = [rand(board_size), rand(board_size)]
        end 
        guess 
    end 

                


end 