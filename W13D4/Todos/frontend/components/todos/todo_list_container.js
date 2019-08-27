import { connect } from 'react-redux';
import TodoList from './todo_list';

import { receiveTodo, fetchTodos, createTodo, removeTodo } from '../../actions/todo_actions'
import { allTodos } from '../../reducers/selectors'



const mapStateToProps = (state) => ({
        errors: state.errors,
        todos: allTodos(state)
});

const mapDispatchToProps = (dispatch) => ({
        receiveTodo: (todo) => dispatch(receiveTodo(todo)),
        fetchTodos: (todos) => dispatch(fetchTodos(todos)),
        createTodo: (todo) => dispatch(createTodo(todo)),
        removeTodo: (todo) => dispatch(removeTodo(todo))

});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);


