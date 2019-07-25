class ArtworksController < ApplicationController

    def index
        user = User.find(params[:user_id])
        @artworks = user.artworks
        @shared_artworks = user.shared_artworks
        response = {artworks: @artworks, shared_artworks: @shared_artworks}
        render json: response
    end

    def show
        @artwork = Artwork.find(params[:id])
        @likers = []
        @artwork.likes.each do |like|
            @likers << like.user
        end
        response = {artwork: @artwork, likers: @likers}
        render json: response
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save  
            render json: artwork
        else
            render artwork.errors.full_messages, status: 422
        end
    end

    def update
        artwork = Artwork.find(params[:id])
        artwork.update(artwork_params)
    end


    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end


    private
        def artwork_params
            params.require(:artwork).permit(:title, :image_url, :artist_id)
        end
end