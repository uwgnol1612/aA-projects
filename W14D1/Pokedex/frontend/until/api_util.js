module.exports = {
    fetchAllPokemon() {
        return $.ajax({
            method: "GET",
            url: "/api/pokemon"
        })
    },

    fetchSinglePokemon(id) {
        return $.ajax({
            method: "GET",
            url: `api/pokemon/${id}`
        })
    }
}



