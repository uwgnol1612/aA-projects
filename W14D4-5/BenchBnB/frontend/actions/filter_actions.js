export const UPDATE_BOUNDS = 'UPDATE_BOUNDS';
import { requestBenches } from '../actions/bench_actions' 

export const updateBounds = (bounds) => ({
  type: UPDATE_BOUNDS,
  bounds
})

export const updateFilter = (bounds) => (dispatch, getState) => {
  dispatch(updateBounds(bounds));
    return requestBenches(getState().ui.filters.bounds)(dispatch);
    // delicious curry!
};