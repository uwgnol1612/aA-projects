import { RECEIVE_POKEMON_ERROR } from '../actions/pokemon_actions'

const errorsReducer = (state = [], action) => {
    Object.freeze(state);

    switch (action.type) {
        case RECEIVE_POKEMON_ERROR:
            return [...state, ...action.errors]
        default:
            return state;
    }
}

export default errorsReducer;