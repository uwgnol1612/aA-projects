class BandsController < ApplicationController
    before_action :require_login

    def index
        @bands = Band.all
        render :index
    end 


    def create
        @band = Band.new(band_pramas)

        if @band.save
            flash[:success] = "You have successfully created a band!"
            redirect_to band_url(@band)
        else  
            flash[:error] = @band.errors.full_messages
            render :new
        end 
    end 

    def new
        @band = Band.new
        render :new
    end 

    def edit
        @band = Band.find(params[:id])
        render :edit
    end 

    def show
        @band = Band.find(params[:id])
        render :show 
    end


    def update
        @band = Band.find(params[:id])
        if @band.update_attributes(band_pramas)
            flash[:success] = "Successfully update the band!"
            redirect_to band_url(@band)
        else  
            flash.now[:error] = @band.errors.full_messages
            render :edit
        end 
    end 


    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        flash[:success] = "Band was deleted!"
        redirect_to band_albums_url
    end 


    private
    def band_pramas
        params.require(:band).permit(:name)
    end 

end 