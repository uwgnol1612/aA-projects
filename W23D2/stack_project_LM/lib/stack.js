// ============================================================================
// Implementation Exercise: Stack
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Stack and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
    constructor(val) {
    this.value = val;
    this.next = null;
    }
   

}

class Stack {
    constructor() {
        this.top = null;
        this.bottom = null;
        this.length = 0
    }

    push(val) {
        let newNode = new Node(val)
        if (!this.top) {
            this.top = newNode;
            this.bottom = newNode
        } else {
            newNode.next = this.top
            this.top = newNode
        }
        this.length ++
        return this.size();

    }

    pop() {
        if (!this.top) {
            return null
        }
        let first = this.top
        if (this.length === 1) {
            this.top = null;
            this.bottom = null
        } else {    
            let second = this.top.next;
            this.top = second
            first.next = null
        }
        this.length --
        return first.value

    }

    size() {
        return this.length
    }

}

exports.Node = Node;
exports.Stack = Stack;
