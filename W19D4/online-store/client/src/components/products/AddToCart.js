import React from 'react';
import { some } from "lodash";
import { Query, ApolloConsumer } from "react-apollo";

import Queries from "../../graphql/queries";
const { FETCH_CART_ITEMS } = Queries;

class AddToCart extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
        return (
            <ApolloConsumer>
                {client => (<Query query={FETCH_CART_ITEMS}>
                    {({ data, loading }) => {
                        // if we have some one logged in we show them a logout button
                
                          if (loading) {
                            return (
                              <div>
                                Loading...
                              </div>
                            );
                          }
                          let productIds = [];
                          data.cart.forEach(product => {
                            productIds.push(product._id);
                          });
        
                          if (productIds.includes(this.props.product._id)) {
                        
                            return (
                                <button
                                    onClick={ () => {
                                        const updated_cart = data.cart.filter(item => {
                                          return item._id !== this.props.product._id;
                                        })
                                        client.writeData({ data: { cart: updated_cart } });

                                    }}
                                >Remove Item</button>
                            );
                        } else {
                            
                            return (
                                <button
                                    onClick={ () => {
                                        const updated_cart = data.cart.concat([this.props.product]);                     
                                        client.writeData({ data: { cart: updated_cart } });
                                    }}
                                >Add Item</button>
                            );
                        }
                    }}
                </Query>
                )}
            </ApolloConsumer>
        );

    }
}

export default AddToCart;