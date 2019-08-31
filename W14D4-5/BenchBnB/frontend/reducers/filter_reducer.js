import { UPDATE_BOUNDS } from '../actions/filter_actions';

const filterDefaultState = {
    bounds : {} 
}

const filterReducer = (state = filterDefaultState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case UPDATE_BOUNDS:
      return  { bounds: action.bounds }
    default:
      return state;
  }
}

export default filterReducer;
