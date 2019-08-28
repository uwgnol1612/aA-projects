export const selectAllPokemon = (state) => {
    return Object.values(state.entities.pokemon)
}

export const selectPokeItems = (state, pokemon) => {
    const allitems = [];
    // debugger
    Object.values(state.entities.items).forEach(item => {
        if (pokemon.item_ids.includes(item.id)) {
            allitems.push(item);
        }
    })
    return allitems;

}

export const selectPokemonItem = (state, itemId) => {
    return state.entities.items[itemId]
}






