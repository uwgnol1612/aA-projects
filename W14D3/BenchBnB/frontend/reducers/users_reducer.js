import { RECEIVE_CURRENT_USER } from '../actions/session_actions'

export const usersReducer = (state = {}, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
        return Object.assign({}, state, { [action.user.id]: action.user });  ///are the [] necessary?
        default:
            return state;
    }
};

// { [action.user.id]: action.user }
// { [1] : long }

// 1: user1
// [action.user.id]

// state.entities.users[state.session.id].