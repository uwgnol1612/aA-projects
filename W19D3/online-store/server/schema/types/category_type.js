const graphql = require("graphql");
const mongoose = require("mongoose");
const { GraphQLObjectType, GraphQLString, GraphQLID, GraphQLList } = graphql
// const ProductType = require('./product_type.js')
const Category = mongoose.model("categories");

const CategoryType = new GraphQLObjectType({
  name: "CategoryType",
  
  fields: () => ({
    _id: { type: GraphQLID },
    name: { type: GraphQLString },
    products: {
      type: new GraphQLList(require("./product_type")),
      resolve(parentValue) {
        return Category.findById(parentValue._id)
          .populate("products").then(category => category.products)
      }}
  })
});

module.exports = CategoryType;