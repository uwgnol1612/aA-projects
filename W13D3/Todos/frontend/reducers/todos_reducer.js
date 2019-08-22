import { receiveTodo , receiveTodos ,RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions'

import merge from 'lodash/merge'

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};


const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS: 
      const newTodos = action.todos;
      // return Object.assign({}, state, {
      //    [newTodos.id]: newTodos  
      //   });
      let newState = {};
      newTodos.forEach(todo => {
        newState[todo.id] = todo;
      })
      return newState;
      // return newTodos.map(todo => { return Object.assign({}, state, {[todo.id]: todo})});

    case RECEIVE_TODO:
      let newTodo = {};
      newTodo[action.todo.id] = action.todo;
      return merge(newTodo, state);
    default:
      return state;
  }
};

export default todosReducer;




// reducers/todos_reducer.js

// const todosReducer = (state = initialState, action) => {
//   //...
// }
















// import merge from 'lodash/merge';
// import bleatsReducer from './bleats_reducer';
// import { combineReducers } from 'redux';

// const rootReducer = (state = {}, action) => {
//   // debugger;
//   return {
//     bleats: bleatsReducer(state.bleats, action),
//     // locations: locationsReducer(state.locations, action)
//   };
// };

// // const rootReducer = combineReducers({
// //   bleats: bleatsReducer,
// //   // locations: locationsReducer
// // });



// export default rootReducer;