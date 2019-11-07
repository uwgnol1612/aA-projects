const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLList, GraphQLID, GraphQLNonNull } = graphql;
const index = require("../../models/index");
const UserType = require("./user_type");
const User = mongoose.model("users");
const Category = mongoose.model("categories");
const CategoryType = require("./category_type");
const Product = mongoose.model("products");
const ProductType = require("./product_type");

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
        category: {
         type: CategoryType, 
         args: { _id: { type: new GraphQLNonNull(GraphQLID) } }, 
         resolve(_, args) {
           return Category.findById(args._id);
         }
       },
       categories: {
         type: new GraphQLList(CategoryType),
         resolve(){
           return Category.find({})
         }
       },
       products: {
           type: new GraphQLList(ProductType),
           resolve(){
               return Product.find({})
           }
       },
       product: {
           type: ProductType,
           args: { _id: { type: new GraphQLNonNull(GraphQLID) } },
           resolve(_, args) {
               return Product.findById(args._id) 
           }
       }
       
       
    })
});

module.exports = RootQueryType;