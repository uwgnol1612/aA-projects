function breadthFirstSearch(startingNode, targetVal) {
    let visited = new Set();
    let queue = [ startingNode ];

    while (queue.length) {
        let node = queue.shift();

        if (visited.has(node.val)) continue;
        if (node.val === targetVal) return node;
        
        visited.add(node.val)
        queue.push(...node.neighbors)
    }
    return null;

}

module.exports = {
    breadthFirstSearch
};