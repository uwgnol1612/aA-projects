class TracksController < ApplicationController
    before_action :require_login

    def index 
        if params.has_key?(:album_id)
            @tracks = Track.where(album_id: params[:album_id])
        else
            @tracks = Track.all
        end   

        render :index 
    end 

    def new 
        @track = Track.new
        render :new  
    end
    
    def create
        @track = Track.new(track_params)

        if @track.save
            flash[:success] = "New track saved!"
            redirect_to track_url(@track)
        else
            flash[:error] = @track.errors.full_messages
            render :new 
        end     

    end 

    def edit
        @track = Track.find(params[:id])
        render :edit   
    end   

    def show
        @track = Track.find(params[:id])
        render :show 
    end 

    def update
        @track = Track.find(params[:id])

        if @track.update_attributes(track_params)
            flash[:success] = "track updated!"
            redirect_to track_url(@track)
        else
            flash[:error] = @track.errors.full_messages
            render :edit
        end   
    end     

    def destroy
        @track = Track.find(params[:id])
        @track.destroy
        flash[:success] = "track deleted!"
        redirect_to album_tracks_url(:album_id)  
    end   


    def track_params
        params.require(:track).permit(:title, :ord, :album_id, :regular, :lyrics)
    end

end 