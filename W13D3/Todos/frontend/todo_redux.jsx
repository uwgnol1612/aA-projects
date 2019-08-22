import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root'
import configureStore from './store/store';


const store = configureStore();
window.store = store;
window.allTodos = allTodos;

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
});
