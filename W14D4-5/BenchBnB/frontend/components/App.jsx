import React from 'react';
import GreetingContainer  from './greeting_container';
import { Route } from 'react-router-dom';
import LoginFormContainer from './login_form_container';
import SignupFormContainer from './signup_form_container';
import SearchContainer from './search_container';
import {AuthRoute} from '../util/route_util';


const App = () => (
    <div>
        <h1>Bench BnB</h1>
        <GreetingContainer/>
        
        <AuthRoute path="/login" component={LoginFormContainer} />
        <AuthRoute path="/signup" component={SignupFormContainer} />

        <Route exact path="/" component= {SearchContainer} />
        
    </div>

);

export default App;