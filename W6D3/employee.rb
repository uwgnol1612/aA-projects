class Employee
    attr_reader :name, :salary, :title, :boss
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary

    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) unless boss.nil? 
    end 

    def bonus(multiplier)
        @salary * multiplier
    end 
end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        @employees = []
        super(name, title, salary, boss)
    end

    def add_employee(sub)
        employees << sub
    end 

    def bonus(multiplier)
        self.total_salary * multiplier
    end 

    def total_salary
        total_salary = 0
        employees.each do |employee|
            if employee.is_a?(Manager)
                total_salary += employee.salary + employee.total_salary
            else  
                total_salary += employee.salary 
            end  
        end 
        total_salary
    end 

end

# manager = Manager.new("Darren", "Manager", 78000, "Ned", employees)
# employees = [Employee.new("Shawna", "TA", 12000, "Darren"), Employee.new("David", "TA", 10000, "Darren")]