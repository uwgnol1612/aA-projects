import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from '../actions/session_actions';

const _nullSession = {
  id: null
}

const sessionReducer = (state = _nullSession, action ) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const { id } = action.currentUser;
      return Object.assign({}, { id });

      // return Object.assign({}, {[action.currentUser.id] : action.currentUser}); //action
    case LOGOUT_CURRENT_USER:
      return _nullSession;
    default:
      return state;
  }
}



export default sessionReducer;


