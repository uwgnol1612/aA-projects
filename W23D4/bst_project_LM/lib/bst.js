class TreeNode {
    constructor(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}


class BST {
    constructor() {
        this.root = null
    }

    insert(val, root=this.root) {
        let node = new TreeNode(val);
        
        if (!this.root) {
            this.root = node;
            return 
        }
        if (val < root.val) {
            if (!root.left) {
                root.left = node
            } else {
                this.insert(val, root.left)
            }
        } else {
            if (!root.right) {
                root.right = node  
            } else {
                this.insert(val, root.right)
            }
        }

    }

    searchRecur(val, root=this.root) {
        if (!root) return false;

        if (val < root.val) {
            return this.searchRecur(val, root.left);
        } else if (val > root.val) {
            return this.searchRecur(val, root.right);
        } else {
            return true;
        }
    }

    searchIter(val) {

        let current = this.root;
        while (current) {
            if (current.val < val) {
                current = current.right
                
            } else if (current.val > val) {
                current = current.left
                
            } else {
                return true
            }
        }
        return false
    }

   
}

module.exports = {
    TreeNode,
    BST
};