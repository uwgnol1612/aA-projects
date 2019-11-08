const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const CategorySchema = new Schema({
  name: {
    type: String,
    required: true
  },
  products: [{
    type: Schema.Types.ObjectId,
    ref: "product"
  }]
});

CategorySchema.statics.findProducts = (categoryId) => {
  const Category = mongoose.model("category");
  return Category.findById(categoryId)
  .populate("products").then(category => category.products)
};

module.exports = mongoose.model("category", CategorySchema);