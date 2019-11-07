const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const db = require("../config/keys").mongoURI;
const models = require("./models/index");
const app = express();
const schema = require('./schema/schema')
const expressGraphQL = require("express-graphql");

if (!db) {
  throw new Error("You must provide a string to connect to MongoDB Atlas");
}

mongoose
  .connect(db, { useNewUrlParser: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch(err => console.log(err));

app.use(
  "/graphql",
  expressGraphQL({
    schema,
    graphiql: true
  })
);

// remember we use bodyParser to parse requests into json
app.use(bodyParser.json());

module.exports = app;