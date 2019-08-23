import React from 'react';

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {

        const pokemons = this.props.pokemons;
            const allPokemons = pokemons.map(pokemon => <li
                key={pokemon.id}
                className="pokemon-li" >
                <h4>{pokemon.name}</h4>
                <img src={pokemon.image_url}/> 
            </li>)

        return (
            <ul>
                {allPokemons}
            </ul>
        )
    }
}

export default PokemonIndex;