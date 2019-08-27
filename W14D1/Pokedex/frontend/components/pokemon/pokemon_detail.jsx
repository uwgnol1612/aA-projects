import React from 'react';

class PokemonDetail extends React.Component {

    componentDidMount() {
        this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }

    componentDidUpdate(prevProps) {
        if (this.props.match.params.pokemonId !== prevProps.match.params.pokemonId) {
            this.props.requestSinglePokemon(this.props.match.params.pokemonId);
        }
    }

    render() {
        const items = this.props.items.map(item => <li>{item.name}</li>)

        // debugger
       
        return (
        <section className="pokemon-detail">
            <figure>
                <img src={this.props.pokemon.image_url}/>
            </figure>
        <ul>
            <li>
                <h2>{this.props.pokemon.name}</h2>
            </li>
            <li>Type: {this.props.pokemon.poke_type}</li>
            <li>Attack: {this.props.pokemon.attack}</li>
            <li>Defense: {this.props.pokemon.defense}</li>
            <li>Moves: {this.props.pokemon.moves.join(' ')}</li>
        
        </ul>
        <ul>
            {items}
        </ul>
          
        </section>
        )

    }

}


export default PokemonDetail;