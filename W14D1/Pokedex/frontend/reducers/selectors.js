export const selectAllPokemon = (state) => {
    return Object.values(state.entities.pokemon)
}

export const selectPokeItems = (state, pokemon) => {
    const allitems = [];
    Object.values(state.entities.items).forEach(item => {
        if (pokemon.item_ids.includes(item.id)) {
            allitems.push(item);
        }
    })
    return allitems;

}




