// View the full problem and run the test cases at:
//  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/


function sortedArrayToBST(nums) {
    if (!nums.length) return null;
    
    let midIndex = Math.floor(nums.length / 2)
    let root = new TreeNode(nums[midIndex])
    let left = nums.slice(0, midIndex);
    let right = nums.slice(midIndex + 1);

    root.left = sortedArrayToBST(left);
    root.right = sortedArrayToBST(right);

    return root

}




