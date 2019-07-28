class AlbumsController < ApplicationController
    before_action :require_login

    def index 
        if params.has_key?(:band_id)
            @albums = Album.where(band_id: params[:band_id])
        else
            @albums = Album.all
        end   

        render :index 
    end 


    def new 
        @album = Album.new
        render :new  
    end
    
    def create
        @album = Album.new(album_params)

        if @album.save
            flash[:success] = "Album saved!"
            redirect_to album_url(@album)
        else
            flash[:error] = @album.errors.full_messages
            render :new 
        end     

    end 

    def edit
        @album = Album.find(params[:id])
        render :edit   
    end   

    def show
        @album = Album.find(params[:id])
        render :show 
    end 

    def update
        @album = Album.find(params[:id])

        if @album.update_attributes(album_params)
            flash[:success] = "Album updated!"
            redirect_to album_url(@album)
        else
            flash[:error] = @album.errors.full_messages
            render :edit
        end   
    end     

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        flash[:success] = "Album deleted!"
        redirect_to albums_url  
    end   


    def album_params
        params.require(:album).permit(:title, :year, :band_id, :live)
    end
end 