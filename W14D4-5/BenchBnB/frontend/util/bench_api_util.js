export const fetchBenches = (bounds) => {
    return $.ajax({
        method: 'GET',
        url: 'api/benches',
        data: { bounds },
        error: (error) => console.log(error)

    })
}
