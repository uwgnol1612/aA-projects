require 'date'

class Cat <  ApplicationRecord

    COLOR = ['grey', 'white', 'black']

    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :sex, inclusion: {in: ['M','F']}
    validates :color, inclusion: {in: COLOR }
    

    def age
        current_day = Date.today 
        months = (current_day.year - birth_date.year)*12 + current_day.month - birth_date.month
        if months < 12
            return "#{months%12} months"
        else  
            return "#{months/12} year #{months%12} months"
        end 

    end


end