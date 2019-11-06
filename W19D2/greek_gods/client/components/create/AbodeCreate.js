import React from "react";
import { Mutation } from "react-apollo";

import * as Mutations from "../../graphql/mutations";
import { FETCH_ABODES } from "../../graphql/queries";
const { NEW_ABODE } = Mutations;


class AbodeCreate extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            name: '',
            coordinates: ''
        }
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(field) {
        return (e => this.setState({
            [field]: e.target.value
        }))
    }

    handleSubmit(e, newAbode) {
        e.preventDefault();
        newAbode({
            variables: {
                name: this.state.name,
                coordinates: this.state.coordinates
            }
        })
            .then(abode => {
                console.log(abode);
                this.setState({
                    name: '',
                    coordinates: ''
                });
            })
    }

    updateCache(cache, { data: { newAbode } }) {
        let abodes;
        try {
            abodes = cache.readQuery({ query: FETCH_ABODES });
        } catch (err) {
            return;
        }
        if (abodes) {
            let abodesArray = abodes.abodes;
            cache.writeQuery({
                query: FETCH_ABODES,
                data: { abodes: abodesArray.concat(newAbode) }
            });
        }
    }


    render() {
        return (
            <Mutation mutation={NEW_ABODE}
                update={(cache, data) => this.updateCache(cache, data)}>
                {(newAbode, { data }) => {
                    return (
                        <div>
                            <form onSubmit={e => this.handleSubmit(e, newAbode)}>
                                <input
                                    value={this.state.name}
                                    onChange={this.update("name")}
                                    placeholder="Name"
                                />
                                <input
                                    value={this.state.coordinates}
                                    onChange={this.update("coordinates")}
                                    placeholder="coordinates"
                                />
                                <input type="submit" value="Create a abode"></input>
                            </form>
                        </div>
                    );
                }}
            </Mutation>
        )
    }

};

export default AbodeCreate;