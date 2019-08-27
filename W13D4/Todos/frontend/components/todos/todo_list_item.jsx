import React from 'react';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props)
        this.handleRemove = this.handleRemove.bind(this)
        this.handleToggle = this.handleToggle.bind(this)
    }

    handleRemove(e) {
        e.preventDefault();
        this.props.removeTodo(this.props.todo);
    }

    updateTodo(todo) {
        todo.done = todo.done === true ? false : true 
        return todo;
    }

    handleToggle(e) {
        e.preventDefault();
        const updatedTodo = this.updateTodo(this.props.todo);
        this.props.receiveTodo(updatedTodo);
    }


    render() {
        const doneVal = this.props.todo.done ? "Done" : "Undone"
       return (
       <li>{this.props.todo.title}
       <div className= "todo-button">
       <button onClick={this.handleRemove}>Delete</button>
       <button onClick={this.handleToggle}>{doneVal}</button>
        </div>
        </li>
        )
    }
}


export default TodoListItem;