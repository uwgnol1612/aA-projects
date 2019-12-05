// View the full problem and run the test cases at:
//  https://leetcode.com/problems/balanced-binary-tree/


function isBalanced(root) {
    if (!root) return true
    let heightDiff = Math.abs(getHeight(root.left) - getHeight(root.right)) 
    return heightDiff <= 1 && isBalanced(root.left) && isBalanced(root.right) 

}

function getHeight(root) {
    if (!root) return -1;
    return 1 + Math.max(getHeight(root.left), getHeight(root.right))
}