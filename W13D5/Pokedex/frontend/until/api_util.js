module.exports = {
    fetchAllPokemon() {
        return $.ajax({
            method: "GET",
            url: "/api/pokemon"
        })
    }
}

