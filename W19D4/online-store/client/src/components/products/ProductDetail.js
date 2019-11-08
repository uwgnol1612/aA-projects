import React from 'react';
import { Query } from 'react-apollo';
import AddToCart from './AddToCart';
import Queries from "../../graphql/queries";
const { FETCH_PRODUCT } = Queries;



const ProductDetail = (props) => {
  return (
    <Query query={FETCH_PRODUCT} variables={{ id: props.match.params.productId }}>
      {({ loading, error, data }) => {
        if (loading) return "Loading...";
        if (error) return `Error! ${error.message}`;

        return (
          <div>
            <h1>{data.product.name}</h1>
            <p>{data.product.description}</p>
            <p>{data.product.weight} lb</p>
            <p>Price: ${data.product.price}</p>
            <AddToCart product={data.product} />
          </div>
        );
      }}
    </Query>
  );
}

export default ProductDetail;