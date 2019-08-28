import React from 'react';
import { Link } from 'react-router-dom';


class PokemonIndexItem extends React.Component {
    render() {
        return (
            <li className="pokemon-li">   
                <Link to={`/pokemon/${this.props.pokemon.id}`}>{this.props.pokemon.name}</Link>
                <img src={this.props.pokemon.image_url} /> 
            </li>
        );
    }
}

export default PokemonIndexItem;