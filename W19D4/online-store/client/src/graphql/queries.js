import gql from "graphql-tag";

const FETCH_PRODUCTS = gql`
  {
    products {
      _id
      name
      description
      price
    }
  }
`;

const IS_LOGGED_IN = gql`
  query IsUserLoggedIn {
    isLoggedIn @client
  }
`;

const FETCH_PRODUCT = gql`
  query FetchProduct($id: ID!) {
    product(_id: $id) {
      _id
      name
      description
      weight
      price
    }
  }
`;

const FETCH_CART_ITEMS = gql`
  query FetchCartItems {
    cart @client {
      name,
      description,
      weight,
      price,
      _id
    }
  }
`;

export default { FETCH_PRODUCTS, IS_LOGGED_IN, FETCH_PRODUCT, FETCH_CART_ITEMS };