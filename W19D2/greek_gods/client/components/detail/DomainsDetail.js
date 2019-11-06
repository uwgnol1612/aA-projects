import React from "react";
import { Mutation } from "react-apollo";
// we added the "react-icons" library to have access to a pencil icon for editting
import { IconContext } from "react-icons";
import { FaPencilAlt } from "react-icons/fa";
import * as Mutations from '../../graphql/mutations';
const { ADD_GOD_DOMAIN, REMOVE_GOD_DOMAIN } = Mutations;
import * as Queries from '../../graphql/queries';
const {FETCH_GOD} = Queries;

class DomainsDetail extends React.Component {
  constructor(props) {
    super(props);

    // since we know we'll be receiving the god's name through props
    // we can set it in our state
    this.state = {
      editing: false,
      domain: "",
      removedomain: ""
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

//   updateCache(cache, { data: { newGod } }) {
//     let gods;
//     try {
//       gods = cache.readQuery({ query: FETCH_GOD });
//     } catch (err) {
//       return;
//     }
//     if (gods) {
//       let godArray = gods.gods;
//       cache.writeQuery({
//         query: FETCH_GOD,
//         data: { gods: godArray.concat(newGod) }
//       });
//     }
//   }  


  render() {
    // if we are editing we'll return a Mutation component
    
    if (this.state.editing) {
      return (
        <div>
        <Mutation mutation={ADD_GOD_DOMAIN}
            // update={(cache, data) => this.updateCache(cache, data)}>
                  refetchQueries={
                      () => {
                          return [
                              {
                                  query: FETCH_GOD,
                                  variables:{id: this.props.id}
                              }
                            ]
                      }
                  }
        >
          {(addGodDomain, data) => (
            <div>
              <form
                onSubmit={e => {
                  e.preventDefault();
                  addGodDomain({
                    variables: { godId: this.props.id, domain: this.state.domain }
                  }).then(() => this.setState({ editing: false }));
                }}
              >
                <input
                  value={this.state.domain}
                  onChange={this.fieldUpdate("domain")}
                />
                <button type="submit">Add Domain</button>
              </form>
            </div>
          )}
        </Mutation>
        <br/>
        <Mutation mutation={REMOVE_GOD_DOMAIN}
            // update={(cache, data) => this.updateCache(cache, data)}
                  refetchQueries={
                      () => {
                          return [
                              {
                                  query: FETCH_GOD,
                                  variables: { id: this.props.id }
                              }
                          ]
                      }
                  }
        >
          {(removeGodDomain, data) => (
            <div>
              <form
                onSubmit={e => {
                  e.preventDefault();
                  removeGodDomain({
                    variables: { godId: this.props.id, domain: this.state.removedomain }
                  }).then(() => this.setState({ editing: false }));
                }}
              >
                <input
                  value={this.state.removedomain}
                  onChange={this.fieldUpdate("removedomain")}
                />
                <button type="submit">Remove Domain</button>
              </form>
            </div>
          )}
        </Mutation>
      </div>
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
          {this.props.domains.map((domain, idx) =>  
           <li key={idx}>{domain}</li> )}
        </div>
      
      );
    }
  }
}

export default DomainsDetail;
