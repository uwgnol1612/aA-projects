import React from 'react';

class ItemDetail extends React.Component {

    render() {
        return (
            <div>
                <li>{this.props.item.name}</li>
                <li>Price: $ {this.props.item.price}</li>
                <li>Happiness: {this.props.item.happiness}</li>
            </div>
        
        )
    }

}
export default ItemDetail;


