import React from 'react';

const CartItem = (props) => {
    return (
        <div>
            <li>Name: {props.item.name}</li>
            <li>Price: ${props.item.price}</li>
            <li>Weight: {props.item.weight}</li>
            <li>Description: {props.item.description}</li>
        </div>
    )
}

export default CartItem;