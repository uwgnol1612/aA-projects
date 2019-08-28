export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_POKEMON_ERRORS = "RECEIVE_POKEMON_ERRORS";

import * as APIUtil from '../until/api_util';


export const receiveAllPokemon = (pokemon) => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
})

export const receivePokemon = (payload) => {
    // debugger;
    return {
        type: RECEIVE_SINGLE_POKEMON,
        payload
    }
}

export const receivePokemonErrors = (errors) => ({
    type: RECEIVE_POKEMON_ERRORS,
    errors
})
    

export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon().then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)


export const requestSinglePokemon = (id) => (dispatch) => (
    APIUtil.fetchSinglePokemon(id).then(pokemon => dispatch(receivePokemon(pokemon)))
)


export const createPokemon = (pokemon) => (dispatch) => (

    APIUtil.createPokemon(pokemon).then(
        pokemon => {dispatch(receivePokemon(pokemon))
            return pokemon;
        }).fail(errors => { dispatch(receivePokemonErrors(errors.responseJSON))
        })

);






