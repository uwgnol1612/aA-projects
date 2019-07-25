require_relative "Questions_Database.rb"
require_relative "questions.rb"
require_relative "reply.rb"
require_relative "question_follows.rb"
require_relative "question_likes.rb"

class Users
    
    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        person = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM 
            users
        WHERE 
            id = ?  
        SQL
        Users.new(person.first)
    end

    def initialize(option)
        @id = option['id']
        @fname = option['fname']
        @lname = option['lname']
    end

    def self.find_by_name(fname, lname)
       person = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT 
            *
        FROM 
            users
        WHERE 
            fname = ? AND lname = ?  
        SQL
        Users.new(person.first)
    end 
    

    def authored_questions
        Questions.find_by_author_id(self.id)
    end
    
    def authored_replies
        Reply.find_by_user_id(self.id)
    end 


    def followed_questions
        QuestionFollows.followed_questions_for_user_id(self.id) 
    end 

    def liked_questions
        QuestionLike.liked_questions_for_user_id(self.id)
    end

    def average_karma
        
    end 

end