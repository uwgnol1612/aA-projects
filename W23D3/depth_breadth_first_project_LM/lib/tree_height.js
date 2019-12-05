function treeHeight(root) {
    if (!root) return -1
    
    let stack = [ root ];
    let edgeNums = [];
    
    let counter = 0
    while (stack.length) {
        let node = stack.pop();
        if (!node.left && !node.right) {
            edgeNums.push(counter);
            counter = 0
        }
        if (node.left) stack.push(node.left);
        if (node.right) stack.push(node.right);
        counter ++
    }

    return Math.max(...edgeNums)

}


module.exports = {
    treeHeight
};