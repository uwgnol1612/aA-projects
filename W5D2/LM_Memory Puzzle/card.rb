class Card 
    VALUES = ("A".."Z").to_a
    attr_accessor :face_up, :face_value 

    def self.shuffled_pairs(num_pair)
        values = VALUES
        values = (values.shuffle.take(num_pair)) * 2
        values.shuffle!
        values.map {|val| self.new(val)}
    end 

    def initialize(value) 
        @face_value = value  
        @face_up = false
    end 

    def hide 
        @face_up = false 
    end 

    def reveal
        @face_up = true 
    end 

    def revealed?
        @face_up
    end 

    def ==(card)
        card.is_a?(self.class) && @face_value == card.face_value
    end 
end 