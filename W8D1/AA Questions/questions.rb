require_relative "Questions_Database.rb"
require_relative "users.rb"
require_relative "question_follows.rb"
require_relative "question_likes.rb"


class Questions
    attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(id)
        person = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM 
            questions
        WHERE 
            id = ?  
        SQL
        Questions.new(person.first)
    end

    def self.find_by_author_id(author_id)
        person = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT 
            *
        FROM 
            questions
        WHERE 
            author_id = ?
        SQL
        Questions.new(person.first)
    end

    def self.most_followed(n)
        QuestionFollows.most_followed_questions(n)
    end

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end 
    

    def initialize(option)
        @id = option['id']
        @title = option['title']
        @body = option['body']
        @author_id = option['author_id']
    end 

    def author
        author_id = self.author_id
        Users.find_by_id(author_id)
    end 

    def replies
        question_id = self.id 
        Reply.find_by_question_id(question_id) 
    end 

    def followers
        question_id = self.id
        QuestionFollows.followers_for_question_id(question_id)
    end 

    def likers
        QuestionLike.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(self.id)
    end

end