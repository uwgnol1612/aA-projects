
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './root'

import { receiveAllPokemon } from './actions/pokemon_actions'
import { fetchAllPokemon } from './until/api_util'
import { requestAllPokemon } from './actions/pokemon_actions'
import { selectAllPokemon } from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    // window.store = store;
    // window.getState = store.getState; 
    // window.dispatch = store.dispatch;
  
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
});

// window.receiveAllPokemon = receiveAllPokemon;
// window.fetchAllPokemon = fetchAllPokemon;
// window.requestAllPokemon = requestAllPokemon;
// window.selectAllPokemon = selectAllPokemon;





