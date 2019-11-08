import React from 'react';
import { Query, ApolloConsumer } from "react-apollo";
import CartItem from './CartItem';

import Queries from "../../graphql/queries";
const { FETCH_CART_ITEMS } = Queries;


const Cart = (props) => {
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

                    if (data.cart.length === 0) {
                        return <h3>No items in the cart!</h3>
                    }

                    return (
                        <div>{data.cart.map(item => {
                            return <CartItem item={item} />
                        })}</div>)

                }}
            </Query>
            )}
        </ApolloConsumer>
    );

}

export default Cart;
