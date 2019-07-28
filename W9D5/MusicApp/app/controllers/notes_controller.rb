class NotesController < ApplicationController
    before_action :require_login

    def create
        @note = Note.new(note_params)

        if @note.save
            flash[:success] = "Successfully save the note!"
            redirect_to track_url(@note.track_id)
        else
            flash.now[:error] = @note.errors.full_messages
        end   
    end 


    def destroy
        @note = Note.find(params[:id])
        
        if current_user && @note.user_id == current_user.id 
            @note.destroy
            flash[:success] = "Note deleted!"
            redirect_to track_url(@note.track_id)
        else
            render text: "You cannot delete that note!"
        end   
    end 



    def note_params
        params.require(:note).permit(:body, :user_id, :track_id)
    end 
end 