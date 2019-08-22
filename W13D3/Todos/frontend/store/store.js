import { createStore } from 'redux';
import root_Reducer from '../reducers/root_Reducer';

const configureStore = () => createStore(root_Reducer);



export default configureStore;