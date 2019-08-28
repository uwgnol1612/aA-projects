
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import { Provider } from 'react-redux';
import { HashRouter, Route } from 'react-router-dom'
import PokemonIndexContainer from './components/pokemon/pokemon_index_container';

import { receiveAllPokemon } from './actions/pokemon_actions'
import { fetchAllPokemon, fetchSinglePokemon } from './until/api_util'
import { requestAllPokemon, requestSinglePokemon } from './actions/pokemon_actions'
import { selectAllPokemon } from './reducers/selectors'
import { createPokemon } from './actions/pokemon_actions'



const Root = ({ store }) => {
    return (
        <Provider store={store}>
            <HashRouter>
                <Route path="/" component={PokemonIndexContainer} />
            </HashRouter>
        </Provider>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    window.store = store;
    window.getState = store.getState; 
    window.dispatch = store.dispatch;
  
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
});


window.createPokemon = createPokemon;
window.fetchSinglePokemon = fetchSinglePokemon;
window.requestSinglePokemon = requestSinglePokemon;





