import { Mutation, Query } from 'react-apollo';
import * as Mutations from '../../graphql/mutations';
import * as Queries from '../../graphql/queries';
import React from 'react';

const { DELETE_GOD } = Mutations;
const { FETCH_GODS } = Queries;

const linkStyle = {
    cursor: "pointer",
    fontSize: "10px",
    color: "red"
}

const DeleteGod = props => {
    return (
        <Mutation mutation={DELETE_GOD}
            refetchQueries = {
                () => {
                    return [
                        {
                            query:FETCH_GODS
                        }
                    ]
                }
            }
        >{
            (deleteGod, { data }) => (
                <a
                    style={linkStyle}
                    onClick={e => {
                        e.preventDefault();
                        deleteGod({ variables: { id: props.id } });
                    }}>
                    <p>Delete</p>
                </a>
            )
        }
    </Mutation>
    )
}

export default DeleteGod;