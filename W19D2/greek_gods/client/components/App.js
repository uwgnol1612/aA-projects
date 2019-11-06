import React from 'react';
import { Route, Link, Switch } from 'react-router-dom';
import GodList from './gods/GodList';
import Create from '../components/create/Create'
import GodDetail from './gods/GodDetail';


const App = () => {
  return (
    <div>
        <nav>
            <Link to='/new'>Create Gods/Emblems/Abodes</Link>
            <br />
            <Link to='/'>GodIndex</Link>
        </nav>
        <Switch>
            <Route exact path='/gods/:id' component={GodDetail} />
            <Route exact path='/' component={GodList} />
            <Route path='/new' component={Create} />
        </Switch>
    </div>
    )

}
export default App;