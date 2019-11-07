const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLID } = graphql;
const mongoose = require("mongoose");
const CategoryType = require('./types/category_type');
const ProductType = require('./types/product_type');
const Category = mongoose.model("categories");
const Product = mongoose.model("products");
const UserType = require("./types/user_type");
const AuthService = require('../services/auth')

const mutation = new GraphQLObjectType({
  name: "Mutation",
  fields: {
    newCategory: {
      type: CategoryType, 
      args: {
        name: { type: GraphQLString }, 
      },
      resolve(parentValue, { name }) {
        return new Category({ name }).save();
      }
    }, 
    deleteCategory: {
      type: CategoryType, 
      args: { id: { type: GraphQLID } }, 
      resolve(parentValue, { id }) {
        return Category.remove({ _id: id })
      }  
    },
    newProduct: {
        type: ProductType,
        args: {
            name: { type: GraphQLString },
            description: { type: GraphQLString },
            price: { type: GraphQLInt },
            weight: { type: GraphQLInt }
        },
        resolve(parentValue, { name, description, price, weight }) {
            return new Product({ name, description, price, weight }).save();
        }
    }, 
    deleteProduct: {
      type: ProductType,
      args: { id: { type: GraphQLID } },
      resolve(parentValue, { id }) {
        return Product.remove({ _id: id })
      }
    },

    updateProductCategory: {
        type: ProductType, 
        args: { productId: { type: GraphQLID }, categoryId: { type: GraphQLID },  }, 
        resolve(parentValue, args) {
          return Product.updateProductCategory(args.productId, args.categoryId)
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
        return AuthService.register(args)
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
