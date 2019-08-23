class Api::TodosController < ApplicationController 
    def show
        @todo = Todo.find(params[:id])
        render json: @todo
    end 

    def index
        @todos = Todo.all 
        render json: @todos
    end 

    def create
        @todo = Todo.new(todo_parmas)
        if @todo.save 
            render json: @todo 
        else
            render json: @todo.errors.full_messages, status: 422
        end  

    end
    
    def update 
        @todo = Todo.find(params[:id])

        if @todo.updateattribute(todo_parmas)
            render json: @todo 
        else 
            render json: @todo.errors.full_messages
        end 
    end
    
    def destroy 
        @todo = Todo.find(params[:id])
        @todo.destroy

    end 

    def todo_parmas
        params.require(:todo).permit(:title, :body);
    end 
end 