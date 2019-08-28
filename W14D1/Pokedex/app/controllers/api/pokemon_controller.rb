class Api::PokemonController < ApplicationController
    def index
        @pokemons = Pokemon.all
        render :index
    end 

    def show 
        @pokemon = Pokemon.find(params[:id])
        render :show
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)

        if @pokemon.save 
            render :show 
        else
            render @pokemon.errors.full_messages
        end
    end

    def pokemon_params
        params.require(:pokemon).permit(:name, :image_url, :attack, :defense, :poke_type, :item_ids, moves: [])
    end

end 

