class Player
    attr_reader :name 

    def initialize(name)
        @name = name
    end 

    def guess 
        puts "#{name} choose a letter!"
        input = gets.chomp
        until alert_invalid_guess(input)
            puts "#{name} choose a letter!"
            input = gets.chomp
        end
        input
    end  

    def alert_invalid_guess(str)
        alpha = ("a".."z").to_a
        if str.length > 1 || !alpha.include?(str.downcase)
           puts "Invalid letter!"
           return false 
        end 
        true
    end
end 
        
