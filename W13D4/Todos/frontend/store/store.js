import { createStore, applyMiddleware } from 'redux';
import root_Reducer from '../reducers/root_Reducer';

import thunk from '../middleware/thunk'


const preloadedsSate = {}
const configureStore = () => createStore(root_Reducer, preloadedsSate, applyMiddleware(thunk));



export default configureStore;