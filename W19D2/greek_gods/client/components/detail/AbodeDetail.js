import React from "react";
import { Mutation, Query } from "react-apollo";
// we added the "react-icons" library to have access to a pencil icon for editting
import { IconContext } from "react-icons";
import { FaPencilAlt } from "react-icons/fa";
import * as Mutations from '../../graphql/mutations';
const { UPDATE_GOD_ABODE } = Mutations;
import * as Queries from '../../graphql/queries';
const {FETCH_ABODES} = Queries;


class AbodeDetail extends React.Component {
  constructor(props) {
    super(props);

    // since we know we'll be receiving the god's name through props
    // we can set it in our state
    this.state = {
      editing: false,
      abodeId: this.props.abode.id || ""
      
    };

    this.handleEdit = this.handleEdit.bind(this);
  }

  // this is the function that will trigger "editing" mode
  handleEdit(e) {
    e.preventDefault();
    this.setState({ editing: true });
  }

  fieldUpdate(field) {
    return e => this.setState({ [field]: e.target.value });
  }

  abodeList() {
      return (<Query query={FETCH_ABODES}>
          {({ loading, error, data }) => {
            if (loading) return <option> Loading </option>;
            if (error) return <option> Error </option>;

              return data.abodes.map(({ id, name }) => {
                  return <option key={id} value={id}>{name}</option>
              })
          }}
      </Query>)
  }

  render() {
    // if we are editing we'll return a Mutation component

    if (this.state.editing) {
      return (
        <Mutation mutation={UPDATE_GOD_ABODE}>
          {(updateGodAbode, data) => (
            <div>
              <form
                onSubmit={e => {
                  e.preventDefault();
                  updateGodAbode({
                    variables: { godId: this.props.id, abodeId: this.state.abodeId }
                  }).then(() => this.setState({ editing: false }));
                }}
              >
                <select onChange={this.fieldUpdate('abodeId')} value={this.state.abodeId}>
                    {this.abodeList()}
                </select>
                <button type="submit">Update Abode</button>
              </form>
            </div>
          )}
        </Mutation>
      );
    } else {
      return (
        <div>
          <div
            onClick={this.handleEdit}
            style={{ fontSize: "10px", cursor: "pointer", display: "inline" }}
          >
            <IconContext.Provider value={{ className: "custom-icon" }}>
              <FaPencilAlt />
            </IconContext.Provider>
          </div>
          <h2>{this.props.abode.name}</h2>
        </div>
      );
    }
  }
}

export default AbodeDetail;
