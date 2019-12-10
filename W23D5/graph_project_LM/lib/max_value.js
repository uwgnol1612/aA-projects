function maxValue(node, visited=new Set()) {
    let queue = [ node ] 

    let max = node.val

    while (queue.length) {
        let node = queue.shift()
        
        if (visited.has(node.val)) continue;
        if (max < node.val) {
            max = node.val
        }
        visited.add(node.val);
        queue.push(...node.neighbors)

    }

    return max

}

module.exports = {
    maxValue
};