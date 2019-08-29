import React from 'react';
import { Link } from 'react-router-dom';


export default class Greeting extends React.Component {
  render() {
    const currentUser = this.props.currentUser;
    let display;
    
    if (!currentUser) {
      display = <div> 
        <Link to="/signup">Sign Up!!!!!</Link>
        <br/>
        <Link to="/login">Login</Link>
      </div>
    } else {
      display = <div>
        <p>Hello, {currentUser.username}</p>
        <button onClick={this.props.logout}>Log Out</button>
      </div>
    }
    
    return (
        <div>
            {display}
        </div>
    )
  }
}