// ============================================================================
// Implementation Exercise: Queue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Queue and all of its methods below!
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

class Queue {
    constructor() {
        this.front = null;
        this.back = null;
        this.length = 0;
    }

    enqueue(val) {
        let newNode = new Node(val)
        if (!this.front) {
            this.front = newNode;
            this.back = newNode;
        }
        this.back.next = newNode;
        this.back = newNode;
        this.length ++;
        return this.size();
    }

    dequeue() {
        if (!this.front) {
            return null;
        }
        let first = this.front
        if (this.length === 1) {
            this.front = null;
            this.back = null
        } else {
            let second = this.front.next;
            this.front = second;
            first.next = null
        }
        this.length --;
        return first.value

    }

    size() {
        return this.length;

    }

}

exports.Node = Node;
exports.Queue = Queue;