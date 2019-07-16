require_relative "Questions_Database.rb"
require_relative "users.rb"
require_relative "questions.rb"



class QuestionFollows
    def self.followers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            JOIN
                question_follows ON users.id = question_follows.author_id
            WHERE
                question_follows.question_id  = ?
            SQL

        users.map {|user| Users.new(user)}
       
    end
    
    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT 
                *
            FROM 
                questions
            JOIN
                question_follows ON questions.id = question_follows.question_id
            WHERE
                question_follows.author_id = ?
            SQL
        questions.map {|quest| Questions.new(quest)} 
    end 


    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                *
            FROM
                questions
            JOIN
                question_follows ON question_follows.question_id = questions.id 
            GROUP BY
                question_follows.question_id
            ORDER BY
                COUNT(question_follows.author_id) DESC
            LIMIT ?
        SQL
        questions.map {|quest| Questions.new(quest)} 
    end 



    
end