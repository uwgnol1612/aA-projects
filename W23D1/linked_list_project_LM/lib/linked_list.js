// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
        this.value = val;
        this.next = null
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
        if (this.length === 0) {
            let newNode = new Node(val);
            this.head = newNode;
            this.tail = newNode;
        } else {
            let lastNode = this.tail;
            let newNode = new Node(val);
            lastNode.next = newNode
            this.tail = newNode
        }
        this.length ++
        return this;

    }

    // TODO: Implement the removeTail method here
    removeTail() {
        if (this.length === 0) {
            return undefined
        }

        let lastNode = this.tail;
        if (this.length === 1) {
            this.head = null;
            this.tail = null;
        } else {
           let secLastNode = this.get(this.length - 2)
           this.tail = secLastNode;
           this.tail.next = null;
        }
        this.length --
        return lastNode

    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
        let newNode = new Node(val);
        if (this.length === 0) {
            this.head = newNode;
            this.tail = newNode;
        } else {
            let firstNode = this.head;
            this.head = newNode;
            this.head.next = firstNode;
        }
        this.length ++;
        return this;

    }

    // TODO: Implement the removeHead method here
    removeHead() {
        if (this.length === 0) {
            return undefined
        }

        let firstNode = this.head
        let secondNode = this.head.next;

        if (this.length === 1) {
            this.head = null;
            this.tail = null;
        } else {
            this.head = secondNode
        }
        this.length --;
        return firstNode;

    }

    // TODO: Implement the contains method here
    contains(target) {
        let currentNode = this.head
        for (let i = 0; i < this.length; i++) {
            if (currentNode.value === target) {
                return true;
            }
            currentNode = currentNode.next
        }
        return false

    }

    // TODO: Implement the get method here
    get(index) {
        if (index >= this.length || index < 0) {
            return null
        }

        let currentNode = this.head;
        for (let i = 0; i < this.length; i++) {
            if (i === index) {
                return currentNode
            } else {
                currentNode = currentNode.next
            }
        }

    }

    // TODO: Implement the set method here
    set(index, val) {
        let node = this.get(index);
        if (!node) {
            return false
        }
        node.value = val;
        return true

    }

    // TODO: Implement the insert method here
    insert(index, val) {
        if (index >= this.length || index < 0) {
            return false
        }
        if (index === 0) {
            this.addToHead(val)
        } else {
            let newNode = new Node(val);
            let prevNode = this.get(index - 1);
            let nextNode = this.get(index);
            prevNode.next = newNode;
            newNode.next = nextNode;
            this.length ++;
        }
        return true
   

    }

    // TODO: Implement the remove method here
    remove(index) {
        if (index >= this.length || index < 0) {
            return undefined
        }
        if (index === 0) {
            this.removeHead();
        } else if ( index === this.length - 1){
            this.removeTail();    
        } else {
            let node = this.get(index)
            let prevNode = this.get(index - 1);
            let nextNode = this.get(index + 1);
            prevNode.next = nextNode
            this.length --
            return node
        }
        

    }

    // TODO: Implement the size method here
    size() {
        return this.length;

    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
