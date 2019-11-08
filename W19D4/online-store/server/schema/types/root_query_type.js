const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLList, GraphQLID, GraphQLNonNull } = graphql;

const UserType = require("./user_type");
const ProductType = require("./product_type");
const CategoryType = require("./category_type");
require("../../models/index");
const User = mongoose.model("user");
const Product = mongoose.model("product");
const Category = mongoose.model("category");
const axios = require("axios");
const { AWSKey } = require("../../../config/keys");

const authOptions = {
  method: "GET",
  url:
    "https://6ml4lt3rlg.execute-api.us-east-2.amazonaws.com/default/generate-price",
  headers: {
    "x-api-key": AWSKey
  }
};

const RootQueryType = new GraphQLObjectType({
  name: "RootQueryType",
  fields: () => ({
    users: {
      type: new GraphQLList(UserType),
      resolve() {
        return User.find({});
      }
    },
    user: {
      type: UserType,
      args: { _id: { type: new GraphQLNonNull(GraphQLID) } },
      resolve(_, args) {
        return User.findById(args._id);
      }
    },
    products: {
      type: new GraphQLList(ProductType),
      resolve() {
        return Product.find({}).then(
          products => {
            return products.map(
              product => {
                // then fetch our price using the above options
                return axios(authOptions).then(res => {
                  // set our cost onto the Product Object
                  product.price = res.data.cost;
                  // then return the complete product object
                  return product;
              });}
            );
          }
        );
      } 
    },
    product: {
      type: ProductType,
      args: { _id: { type: new GraphQLNonNull(GraphQLID) } },
      resolve(_, args) {
        return Product.findById(args._id).then(product => {
          // then fetch our price using the above options
          return axios(authOptions).then(res => {
            // set our cost onto the Product Object
            product.price = res.data.cost;
            // then return the complete product object
            return product;
          });
        });
      }
    },
    categories: {
      type: new GraphQLList(CategoryType),
      resolve() {
        return Category.find({});
      }
    },
    category: {
      type: CategoryType,
      args: { _id: { type: new GraphQLNonNull(GraphQLID) } },
      resolve(_, args) {
        return Category.findById(args._id);
      }
    }
  })
});

module.exports = RootQueryType;