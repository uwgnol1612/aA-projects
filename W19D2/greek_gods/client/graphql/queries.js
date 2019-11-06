import gql from "graphql-tag";

// we use gql with a template literal to construct graphql queries
export const FETCH_GODS = (
  gql`
    query FetchGods {
      gods {
        id
        name
        description
      }
    }
  `
);

export const FETCH_ABODE = (
  gql`
   query FetchAbode($id: ID!) {
     abode(id: $id) {
       id,
       name,
       coordinates
     }
   }
  `
)
export const FETCH_ABODES = (
  gql`
   query FetchAbodes {
     abodes {
       id,
       name,
       coordinates
     }
   }
  `
);

export const FETCH_EMBLEMS = (
    gql`
    query FetchEmblems {
     emblems {
       id,
       name
     }
   }
  `
);

export const FETCH_GOD = (
    gql`
    query FetchGod($id: ID!) {
        god(id: $id){
            id,
            name,
            type,
            description,
            domains,
            abode {
                id,
                name
            },
            emblems {
                id,
                name
            },
            children {
                id,
                name
            },
            siblings {
                id,
                name
            },
            parents {
                id,
                name
            }
        }
        
    }
    `
)

export const FETCH_PARENTS = (
    gql`
    query FetchParents($id: ID!) {
        god(id: $id) {
            parents {
                id,
                name
            }
        }
    }`
)

export const FETCH_SIBLINGS = (
    gql`
    query FetchSiblings($id: ID!) {
        god(id: $id) {
            siblings {
                id,
                name
            }
        }
    }`
)


export const FETCH_CHILDREN = (
    gql`
    query FetchChildren($id: ID!) {
        god(id: $id) {
            children {
                id,
                name
            }
        }
    }`
);
