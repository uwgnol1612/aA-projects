export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
import * as APIUtil from '../until/api_util'

export const receiveAllPokemon = (pokemon) => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
})

export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon().then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)