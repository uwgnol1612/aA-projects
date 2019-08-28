import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
   
    switch (action.type) {
     
        case RECEIVE_ALL_POKEMON:
          return Object.assign({}, state, action.pokemon);
        case RECEIVE_SINGLE_POKEMON:
          // let pokemon = action.payload.pokemon
          return Object.assign({}, state, { [action.payload.pokemon.id]: action.payload.pokemon });
        default:
          return state;
    }
}

export default pokemonReducer;