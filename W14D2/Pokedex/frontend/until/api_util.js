module.exports = {
    fetchAllPokemon() {
        return $.ajax({
            method: "GET",
            url: "api/pokemon"
        })
    },

    fetchSinglePokemon(id) {
        return $.ajax({
            method: "GET",
            url: `api/pokemon/${id}`
        })
    },

    createPokemon(pokemon) {
    
        pokemon.moves = Object.values(pokemon.moves)
        return $.ajax({
            method: "POST",
            url: "api/pokemon",
            data: {pokemon}
        })
    }
}



