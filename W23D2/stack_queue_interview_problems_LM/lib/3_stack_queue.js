// ============================================================================
// Interview Problem: StackQueue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement your preferred Stack implementation, including the methods:
//
//   - Push 
//   - Pop 
//   - Size
//
// Then, implement a Queue by instantiating two Stack instances for storage.
//
// The StackQueue implementation should include the following methods:
//
//   - Enqueue
//   - Dequeue
//   - Size
//
// -----------
// Let's code!
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

    push(node) {

        if (!this.top) {
            this.top = node;
            this.bottom = node
        } else {
            node.next = this.top
            this.top = node
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
        return first

    }

    size() {
        return this.length
    }

}

class StackQueue {
    // TODO: Implement the StackQueue class!
    constructor() {
        this.inStack = new Stack();
        this.outStack = new Stack();
        this.front = null;
        this.back = null
    }

    enqueue(val) {
        let newNode = new Node(val)

        if (!this.front) {
            this.front = newNode;
            this.back = newNode;
        } else {
            this.back.next = newNode;
            this.back = newNode
        }
        this.inStack.push(new Node(newNode.value));
        return this.size();

    }

    dequeue() {
        if (!this.front) {
            return null;
        } else if (this.size() === 1) {
            this.front = null;
            this.back = null;
        } else {
            this.front = this.front.next;
        }

        if (this.outStack.size() === 0) {
            while (this.inStack.size() > 0) {
                this.outStack.push(this.inStack.pop());
            }
        }
        return this.outStack.pop();
    }

    size() {
        return this.inStack.size() + this.outStack.size();
    
    }

};

exports.Node = Node;
exports.Stack = Stack;
exports.StackQueue = StackQueue;
