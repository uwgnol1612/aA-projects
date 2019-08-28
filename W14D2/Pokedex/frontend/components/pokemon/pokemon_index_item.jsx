import React from 'react';
import { Link } from 'react-router-dom';


class PokemonIndexItem extends React.Component {
    render() {
        return (
            
            <li className="pokemon-li">
                   
                <Link to={`/pokemon/${this.props.pokemon.id}`}>
                <span>{this.props.pokemon.id}</span>
                <img src={this.props.pokemon.image_url} />
                <span>{this.props.pokemon.name}</span>
                </Link>
            </li>
        );
    }
}

export default PokemonIndexItem;