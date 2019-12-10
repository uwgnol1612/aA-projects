function numRegions(graph) {
    let visited = new Set()

    let count = 0

    for (let node in graph) {
        if (dfs(node, graph, visited)) {
            count ++
        }
    }

    return count

}

function dfs(node, graph, visited) {
    if (visited.has(node)) return false;
    visited.add(node)
    graph[node].forEach(neighbor => dfs(neighbor, graph, visited))
    return true 
}

module.exports = {
    numRegions
};