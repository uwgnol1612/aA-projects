import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            username: "",
            password: ""
        }
        this.handleSubmit = this.handleSubmit.bind(this);
    };

    update(field) {
        return e => {
            this.setState({[field]: e.target.value})
        }
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state)
        this.props.processForm(user);
    }

    render() {
      const path = (this.props.formType === 'signup') ? '/login' : '/signup' 
        return (
            <div>

            <form>
              <h2>{this.props.formType}</h2>
              
                <label>Username
                    <input type="text" value= {this.state.username} onChange={this.update("username")}/>
                </label>
                <br/>
                <label>Password
                    <input type="password" value={this.state.password} onChange={this.update("password")} />
                </label>
                <br/>
                <button onClick={this.handleSubmit}>{this.props.formType}</button>
            </form>
            <Link to={path}>{path.slice(1)}</Link> 

            </div>
        )

    }
}

export default SessionForm;