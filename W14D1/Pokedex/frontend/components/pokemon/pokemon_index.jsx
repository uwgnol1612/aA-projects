import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import { Route } from 'react-router-dom'

import PokemonDetailContainer from './pokemon_detail_container';


class PokemonIndex extends React.Component {

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {

    
        const pokemons = this.props.pokemons;
        return (
            <section className="pokedex">
            <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
            
                <ul>
                    {pokemons.map(pokemon => <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />)}
                </ul>
            </section>
        )
    }
}

export default PokemonIndex;