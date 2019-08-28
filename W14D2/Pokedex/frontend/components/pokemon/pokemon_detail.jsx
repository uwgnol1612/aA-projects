import React from 'react';
import { Route, Link } from 'react-router-dom'
import ItemDetailContainer from '../items/item_detail_container'

class PokemonDetail extends React.Component {

    componentDidMount() {
        this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }

    componentDidUpdate(prevProps) {
        if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
            this.props.requestSinglePokemon(this.props.match.params.pokemonId);
        }
    }

    render() {
        // debugger
        const pokemon = this.props.pokemon;
        if (!pokemon) return null;
        
        const items = this.props.items.map(item => {
            return (<li>
                <Link to={`/pokemon/${this.props.pokemon.id}/item/${item.id}`}>
                    <img src={item.image_url}/>
                </Link>
            </li>)
        });

        // debugger
       
        return (
        <section className="pokemon-detail">
            <figure>
                <img src={this.props.pokemon.image_url}/>
            </figure>
        <ul>
            <li>{this.props.pokemon.name}</li>
            <li>Type: {this.props.pokemon.poke_type}</li>
            <li>Attack: {this.props.pokemon.attack}</li>
            <li>Defense: {this.props.pokemon.defense}</li>
            <li>Moves: {this.props.pokemon.moves.join(' , ')}</li>
        </ul>

        <section className= "items">
            <h3>Items</h3>

        <ul className="item-list">
           {items}
        </ul>

        <ul>
            <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
        </ul>
        </section>
          
        </section>
        )

    }

}


export default PokemonDetail;