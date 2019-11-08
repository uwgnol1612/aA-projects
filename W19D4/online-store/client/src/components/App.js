import React from "react";
import { Route, Switch } from 'react-router-dom';
import ProductIndex from './products/ProductIndex';
import Login from './Login';
import Register from './Register';
import AuthRoute from '../util/route_util';
import Nav from './Nav';
import ProductDetail from './products/ProductDetail';
import CreateProduct from './products/CreateProduct';
import Cart from './products/Cart'


const App = () => {
  return (
    <div>
      <h1>Online Store</h1>
      <nav>
        <Nav />
      </nav>
      <Switch>
        <AuthRoute exact path="/login" component={Login} routeType="auth"/>
        <AuthRoute exact path="/Signup" component={Register} routeType="auth" />
        <AuthRoute path="/products/new" component={CreateProduct} />
        <AuthRoute path="/cart" component={Cart} />
        <Route path="/products/:productId" component={ProductDetail} />
        <Route path="/" component={ProductIndex} />
      </Switch>
    </div>
  );
};

export default App;