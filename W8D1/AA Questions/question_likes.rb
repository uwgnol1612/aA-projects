require_relative "Questions_Database.rb"
require_relative "users.rb"
require_relative "questions.rb"

class QuestionLike

    def self.likers_for_question_id(question_id)
        likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
            *
        FROM 
            users
        JOIN 
            question_likes ON question_likes.user_id = users.id
        WHERE
            question_likes.question_id = ?
        SQL
        likers.map {|liker| Users.new(liker) }

    end

    def self.num_likes_for_question_id(question_id)
        num = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
            COUNT(*) AS count
        FROM 
            users
        JOIN 
            question_likes ON question_likes.user_id = users.id
        WHERE
            question_likes.question_id = ?
        SQL
        num.first['count']

    end

    def self.liked_questions_for_user_id(user_id)
        likes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT 
            *
        FROM 
            questions
        JOIN 
            question_likes ON question_likes.question_id = questions.id
        WHERE
            question_likes.user_id = ?
        SQL
        likes.map {|liker| Questions.new(liker) }
    end


    def self.most_liked_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                *
            FROM
                questions
            JOIN
                question_likes ON question_likes.question_id = questions.id
            GROUP BY
                questions.id
            ORDER BY
                COUNT(*) DESC
            LIMIT ?
        SQL
        questions.map {|quest| Questions.new(quest)}

    end


end