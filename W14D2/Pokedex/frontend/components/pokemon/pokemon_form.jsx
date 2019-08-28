import React from 'react';
import { withRouter } from "react-router-dom";
import { merge } from 'lodash';

class PokemonForm extends React.Component {
    
    constructor(props) {
      super(props);
      this.state = {name: "",
                    image_url: "",
                    poke_type: "",
                    attack: "",
                    defense: "",
                    moves: {} 
                    };
      this.update = this.update.bind(this);
      this.handleSubmit = this.handleSubmit.bind(this);
      this.updateMove = this.updateMove.bind(this);
    }
    
    handleSubmit(e) {
      e.preventDefault();
    //   debugger
      this.props.createPokemon(this.state).then(newPokemon => {
          this.props.history.push(`pokemon/${newPokemon.pokemon.id}`);
          
      });
    }

    update(property) {
        return e => this.setState({ [property]: e.target.value });
    }

    updateMove(e) {
        // let oldState = [];
        // oldState.push(e.target.value);
        // debugger
        this.setState({ 
            moves: Object.assign({}, this.state.moves, {[e.target.id]: e.target.value}) 
        });
    }
    
    render() {
        let errors;
        if (this.props.errors) {
            errors = this.props.errors.map(error => <li className="error">{error}</li>)
        }
        return (
            
            <div className= "pokemon-form-container">

                <ul>{errors}</ul> 

                <form onSubmit={this.handleSubmit} className= 'pokemon-form'>
                    <label htmlFor="pokemon-name">Name</label>
                    <input onChange={this.update('name')} type="text" id="pokemon-name" value={this.state.name}/>
                    
                    <label htmlFor="pokemon-img">Image url</label>
                    <input onChange={this.update('image_url')} type="text" id="pokemon-img" value={this.state.image_url}/>

                    <select value={this.state.poke_type} onChange={this.update('poke_type')}>
                        <option value="fire">Fire</option>
                        <option value="electric">Electric</option>
                        <option value="normal">Normal</option>
                        <option value="ghost">Ghost</option>
                        <option value="psychic">Psychic</option>
                        <option value="water">Water</option>
                    </select>

                    <label htmlFor="pokemon-attack">Attack</label>
                    <input onChange={this.update('attack')} type="number" id="pokemon-attack" value={this.state.attack}/>

                    <label htmlFor="pokemon-defense">Defense</label>
                    <input onChange={this.update('defense')} type="number" id="pokemon-defense" value={this.state.defense} />

                    <label htmlFor="pokemon-move1">Move 1</label>
                    <input onChange={this.updateMove} type="text" id="move1" value={this.state.moves.move1 || ""}/>

                    <label htmlFor="pokemon-move2">Move 2</label>
                    <input onChange={this.updateMove} type="text" id="move2" value={this.state.moves.move2 || ""}/>

                    <button>Create Pokemon</button>
                    
                </form>

            </div>
            
        )

    }
}
export default withRouter(PokemonForm);