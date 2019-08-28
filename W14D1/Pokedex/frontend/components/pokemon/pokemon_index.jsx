import React from 'react';

import { Route } from 'react-router-dom'

import PokemonDetailContainer from './pokemon_detail_container';
import PokemonIndexItem from './pokemon_index_item';
import PokemonFormContainer from './pokemon_form_container'


class PokemonIndex extends React.Component {

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {
        

    
        const pokemons = this.props.pokemons;
        return (
            <section className="pokedex">

                <Route exact path= "/" component={PokemonFormContainer} />
                <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
                <ul>
                    {pokemons.map(pokemon => <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />)}
                </ul>
            </section>
        )
    }
}

export default PokemonIndex;