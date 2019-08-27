import React from 'react';
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form'

class TodoList extends React.Component {

    componentDidMount() {
        this.props.fetchTodos();
    }

    render() {

        // debugger;

        const todoList = this.props.todos.map(todo => (
            <TodoListItem
                key={todo.id}
                todo={todo}
                removeTodo = {this.props.removeTodo}
                receiveTodo = {this.props.receiveTodo} />)
        );

        return (
            <div>
            <ul className = "todo-list">
                {todoList}
            </ul>
                <TodoForm createTodo = {this.props.createTodo}
                errors = {this.props.errors}
                />
            </div>
        )
    }
}

export default TodoList;