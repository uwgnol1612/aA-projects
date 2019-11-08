const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLList, GraphQLID, GraphQLFloat } = graphql;
const mongoose = require("mongoose");

const UserType = require("./types/user_type");
const ProductType = require("./types/product_type");
const CategoryType = require("./types/category_type");
// require("../models/index");
const User = mongoose.model("user");
const Product = mongoose.model("product");
const Category = mongoose.model("category");
const AuthService = require("../services/auth");

const mutation = new GraphQLObjectType({
  name: "Mutation",
  fields: {
    newCategory: {
      type: CategoryType,
      args: {
        name: { type: GraphQLString },
        // products: { type: GraphQLList }
      },
      resolve(parentValue, {
        name,
        // products
      }) {
        return new Category({
          name,
          // products
        }).save();
      }
    },
    deleteCategory: {
      type: CategoryType,
      args: {
        id: { type: GraphQLID }
      },
      resolve(parentValue, {
        id
      }){
        return Category.remove({
          _id: id
        });
      }
    },
    newProduct: {
      type: ProductType,
      args: {
        // user: { type: GraphQLID },
        // category: { type: GraphQLID },
        name: { type: GraphQLString },
        description: { type: GraphQLString },
        weight: { type: GraphQLFloat }
      },
      async resolve(_, { name, description, weight }, ctx) {
        const validUser = await AuthService.verifyUser({ token: ctx.token });

        if (validUser.loggedIn) {
          return new Product({ name, description, weight }).save();
        } else {
          throw new Error('Sorry, you need to be logged in to create a product.');
        }
      }
    },
    deleteProduct: {
      type: ProductType,
      args: {
        id: { type: GraphQLID }
      },
      resolve(parentValue, {
        id
      }) {
        return Product.remove({
          _id: id
        });
      }
    },
    updateProductCategory: {
      type: ProductType,
      args: {
        productID: { type: GraphQLID },
        categoryID: { type: GraphQLID },
      },
      resolve(parentValue, {
        productID,
        categoryID
      }){
        return Product.updateProductCategory(productID, categoryID);
      }
    },
    register: {
      type: UserType,
      args: {
        name: { type: GraphQLString },
        email: { type: GraphQLString },
        password: { type: GraphQLString }
      },
      resolve(_, args) {
        return AuthService.register(args);
      }
    },
    logout: {
      type: UserType,
      args: {
        // all we need to log the user our is an id
        _id: { type: GraphQLID }
      },
      resolve(_, args) {
        return AuthService.logout(args);
      }
    },
    login: {
      type: UserType,
      args: {
        email: { type: GraphQLString },
        password: { type: GraphQLString }
      },
      resolve(_, args) {
        return AuthService.login(args);
      }
    },
    verifyUser: {
      type: UserType,
      args: {
        token: { type: GraphQLString }
      },
      resolve(_, args) {
        return AuthService.verifyUser(args);
      }
    }
  }
});



module.exports = mutation;