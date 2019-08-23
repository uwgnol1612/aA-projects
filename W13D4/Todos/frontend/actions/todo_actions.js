export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
import * as APIUtil from '../util/todo_api_util';
import { receiveErrors } from  './error_actions';

export const receiveTodos = (todos) => ({
    type: RECEIVE_TODOS,
    todos: todos
})

export const receiveTodo = (todo) => ({
    type: RECEIVE_TODO,
    todo: todo

})

export const fetchTodos = () => {
    return (dispatch) => {
    return APIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
    }
}

export const createTodo = (todo) => {
    return (dispatch) => {
        return APIUtil.createTodo(todo).then(
            todo => dispatch(receiveTodo(todo)),
            error => dispatch(receiveErrors(error.responseJSON))
            )
    }

}


// window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;


