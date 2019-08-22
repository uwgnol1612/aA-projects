import React from 'react';
import TodoListItem from './todo_list_item'


class TodoList extends React.Component {

    render() {

        debugger
        const todoList = this.props.todos.map(todo => (
            <TodoListItem
                key={todo.id}
                todo={todo}
                receiveTodo = {receiveTodo} />)
        );

        return (
            <ul>
                {todoList}
            </ul>
        )
    }
}

export default TodoList;