import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

import configureStore from './store/store';
import { requestBenches } from './actions/bench_actions';

import { fetchBenches } from './util/bench_api_util'


document.addEventListener("DOMContentLoaded", () => {

    const root = document.getElementById("root");
    let store
    
    if (window.currentUser) {
        const preloadedState = {
            entities: {
                users: {
                    [window.currentUser.id]: window.currentUser
                }

            },
            session: {
                id : window.currentUser.id
            }
        };
        
        store = configureStore(preloadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }

    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.requestBenches = requestBenches;
    window.fetchBenches = fetchBenches;

    ReactDOM.render(<Root store={store} />, root);
});

// const filters = {
//     bounds: {
//         "northEast" : { "lat": "40.80971", "lng": "-120.39208" }, 
//         "southWest": { "lat": "35.74187", "lng": "-125.47791" } 
//     }
// }




