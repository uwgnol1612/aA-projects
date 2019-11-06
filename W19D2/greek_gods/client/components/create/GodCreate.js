import React from 'react';
import { Mutation } from 'react-apollo';
import { withRouter } from 'react-router-dom'

import * as Mutations from '../../graphql/mutations';
const { NEW_GOD } = Mutations;

class GodCreate extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      name: '',
      type: 'god',
      description: '',
      message: ''
    }
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field){
    return( e => this.setState({
      [field]: e.target.value
    }))
  }

  handleSubmit(e, newGod){
    e.preventDefault();
    let name = this.state.name;
    newGod({variables: {
        name: name, 
        type: this.state.type,
         description: this.state.description}})
         .then(god => {
           console.log(god);
           this.setState({
             message: `new god ${name} created successfully`,
             name: '',
             type: 'god',
             description: ''
           });
           this.props.history.push('/')
         })
  }

  updateCache(cache, {data: {newGod}}){
    let gods;
    try {
      gods = cache.readQuery({ query: FETCH_GODS});
    } catch (err) {
      return;
    }
    if (gods){
      let godArray = gods.gods;
    cache.writeQuery({
        query: FETCH_GODS,
        data: {gods: godArray.concat(newGod)}
      });
    }
  }  
  
  render (){
    return (
      <Mutation mutation={NEW_GOD}
        update={(cache, data) => this.updateCache(cache, data)}>
        {(newGod, {data})=> {
          return (
            <div>
              <form onSubmit={e => this.handleSubmit(e, newGod)}>
                <input
                  value={this.state.name}
                  onChange={this.update("name")}
                  placeholder="Name"
                />
                <textarea
                  value={this.state.description}
                  onChange={this.update("description")}
                ></textarea>
                <select value={this.state.type} onChange={this.update("type")}>
                  <option value="god">God</option>
                  <option value="goddess">Goddess</option>
               </select>
                <input type="submit" value="Create a god"></input>  
              </form>
              <p>{this.state.message}</p>
            </div>
          );
        }}
      </Mutation>
    )
  }

};

export default withRouter(GodCreate);