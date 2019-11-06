import React from "react";
import { Mutation } from "react-apollo";

import * as Mutations from "../../graphql/mutations";
const { NEW_EMBLEM } = Mutations;


class EmblemCreate extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: ''
    }
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return (e => this.setState({
      [field]: e.target.value
    }))
  }

  handleSubmit(e, newEmblem) {
    e.preventDefault();
    newEmblem({
      variables: {
        name: this.state.name
      }
    })
      .then(emblem => {
        console.log(emblem);
        this.setState({
          name: '',
        });
      })
  }

  updateCache(cache, { data: { newEmblem } }) {
    let emblems;
    try {
      emblems = cache.readQuery({ query: FETCH_EMBLEMS });
    } catch (err) {
      return;
    }
    if (emblems) {
      let emblemsArray = emblems.emblems;
      cache.writeQuery({
        query: FETCH_EMBLEMS,
        data: { emblems: emblemsArray.concat(newEmblem) }
      });
    }
  }


  render() {
    return (
      <Mutation mutation={NEW_EMBLEM}
        update={(cache, data) => this.updateCache(cache, data)}>
        {(newEmblem, { data }) => {
          return (
            <div>
              <form onSubmit={e => this.handleSubmit(e, newEmblem)}>
                <input
                  value={this.state.name}
                  onChange={this.update("name")}
                  placeholder="Name"
                />
                <input type="submit" value="Create a emblem"></input>
              </form>
            </div>
          );
        }}
      </Mutation>
    )
  }

};

export default EmblemCreate;