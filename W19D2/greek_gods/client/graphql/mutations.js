import gql from "graphql-tag";


export const DELETE_GOD = (
  gql`
  mutation DeleteGod($id: ID){
    deleteGod(id: $id){
      id
    }
  }
  `
)

export const NEW_GOD = (
  gql`
     mutation NewGod($name: String, $type: String, $description: String) {
         newGod(name: $name, type: $type, description: $description){
             id,
             name,
             description
         }
     }
    `
)

export const NEW_EMBLEM = (
  gql`
    mutation NewEmblem($name: String){
      newEmblem(name: $name){
        id,
        name
      }
    } 
  `

)
export const NEW_ABODE = (
  gql`
    mutation NewAbode($name: String, $coordinates: String){
      newAbode(name: $name, coordinates: $coordinates){
        id,
        name,
        coordinates
      }
    } 
  `

)

export const UPDATE_GOD_NAME = (
  gql`
    mutation UpdateGod($id: ID!, $name: String){
      updateGod(id: $id, name: $name){
        id,
        name
      }
    }
  `
)
export const UPDATE_GOD_TYPE = (
  gql`
    mutation UpdateGod($id: ID!, $type: String){
      updateGod(id: $id, type: $type){
        id,
        type
      }
    }
  `
)

export const UPDATE_GOD_DESCRIPTION = (
    gql`
    mutation UpdateGod($id: ID!, $description: String){
      updateGod(id: $id, description: $description){
        id,
        description
      }
    }
  `
)
export const ADD_GOD_DOMAIN = (
    gql`
    mutation AddGodDomain($godId: ID!, $domain: String){
      addGodDomain(godId: $godId, domain: $domain){
        id,
        domains
      }
    }
  `
)
export const REMOVE_GOD_DOMAIN = (
    gql`
    mutation RemoveGodDomain($godId: ID!, $domain: String){
      removeGodDomain(godId: $godId, domain: $domain){
        id,
        domains
      }
    }
  `
)


export const UPDATE_GOD_ABODE = (
  gql `
  mutation updateGodAbode($godId: ID! $abodeId: ID!){
    updateGodAbode(godId: $godId, abodeId: $abodeId){
      id,
      abode {
        id,
        name
      }  
    }
  }`
)


