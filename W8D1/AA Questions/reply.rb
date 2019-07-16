require_relative "Questions_Database.rb"
require_relative "users.rb"
require_relative "questions.rb"

class Reply
    attr_accessor :id, :question_id, :parent_reply_id, :author_id, :body

    def self.find_by_id(id)
        person = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM 
            replies
        WHERE 
            id = ?  
        SQL
        Reply.new(person.first)
    end


    def self.find_by_user_id(author_id)
        person = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT 
            *
        FROM 
            replies
        WHERE 
            author_id = ?
        SQL
        Questions.new(person.first)

    end


    def self.find_by_question_id(question_id)
        person = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
            *
        FROM 
            replies
        WHERE 
            question_id = ?
        SQL
        Questions.new(person.first)
    end

    def initialize(option)
        @id = option['id']
        @question_id = option['question_id'] 
        @parent_reply_id = option['parent_reply_id'] 
        @author_id = option['author_id']
        @body = option['body']
    end

    def author
        author_id = self.author_id
        Users.find_by_id(author_id)
    end

    def question
        question_id = self.question_id
        Questions.find_by_id(question_id)
    end

    def parent_reply
        raise "No Parent Sadly" if self.parent_reply_id.nil?
        parent_reply = self.parent_reply_id
        Reply.find_by_id(parent_reply)
    end

    def child_replies
        parent_id = self.id
        reply = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
        SELECT *
        FROM replies
        WHERE parent_reply_id = ? 
        LIMIT 1
        SQL
        Reply.new(reply.first)
    end

end