import { connect } from 'react-redux';

import { requestSinglePokemon } from '../../actions/pokemon_actions';
import { selectPokeItems } from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail'

const mapStateToProps = (state, ownProps) => {

    const pokemon = state.entities.pokemon[ownProps.match.params.pokemonId]
 
    
    return {
        pokemon,
        items: selectPokeItems(state, pokemon)
    }  

};

const mapDispatchToProps = (dispatch) => ({
    requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);