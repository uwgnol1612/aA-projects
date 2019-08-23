import React from 'react'
import { uniqueId } from '../../util/todo_util'
import ErrorList from './error_list'

class TodoForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {title: "", body: "", done: false}

        this.handleSubmit = this.handleSubmit.bind(this);
        // this.updateBody = this.updateBody.bind(this);
        // this.updateTitle = this.updateTitle.bind(this);
    }

    handleSubmit (e) {
        e.preventDefault();

        const todo = Object.assign({}, this.state, { id: uniqueId() });
        this.props.createTodo(todo).then(
            () => this.setState({ title: "", body: "" }))
    }

    // updateBody(e) {
    //     this.setState({body: e.target.value});
    // }

    // updateTitle(e) {
    //     this.setState({title: e.target.value});
    // }

    update(field) {
        return (e) => {
        this.setState({[field]: e.target.value})
        }
    }

    render() {
        return <form className = "todo-form" onSubmit= {this.handleSubmit}>
            <ErrorList errors={this.props.errors} />
            
            <label htmlFor="todo-title">Title:</label>
            <input className = 'title'
            type="text"
            id= "todo-title"
            onChange= { this.update("title") }
            value = {this.state.title}/>
                <br />
            <label htmlFor="todo-body">Body:</label>
            <input className='body'
            type="text"
            id= "todo-body"
            onChange={ this.update("body") }
            value= {this.state.body}/>
            <br/>

        <button>Add to Todo List!</button>

        </form>
    }

}

export default TodoForm;