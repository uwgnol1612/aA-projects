function treeSum(root) {
    let stack = [ root ]
    if (!root) return 0
    let sum = 0
    while (stack.length) {
        let node = stack.pop();
        sum += node.val;
        if (node.left) stack.push(node.left);
        if (node.right) stack.push(node.right);
    }

    return sum;

}


module.exports = {
    treeSum
};