class Node {
    constructor() {
        this.children = {};
        this.isTerminal = false;
    }
}

class Trie {
    constructor() {
        this.root = new Node()
    }

   insertRecur(word, root = this.root) {
       let letter = word[0];

       if (!(letter in root.children)) {
           root.children[letter] = new Node()
       }

       if (word.length === 1) {
           root.children[letter].isTerminal = true
       } else {
           this.insertRecur(word.slice(1), root.children[letter])
       }
       
   }

   insertIter(word, root = this.root) {
       for (let i = 0; i < word.length; i++) {
           let letter = word[i];

           if (!(letter in root.children)) {
               root.children[letter] = new Node
           }
            root = root.children[letter]
         
       }
       root.isTerminal = true
   }

   searchRecur(word, root=this.root) {
       if (word.length === 0) {
           if (root.isTerminal) {
               return true
           } else {
               return false
           }
       } 

       let letter = word[0]

       if (!(letter in root.children)) {
           return false
       } else {
           return this.searchRecur(word.slice(1), root.children[letter])
       }
   }

   searchIter(word, root=this.root) {
       for (let i = 0; i < word.length; i++) {
           let letter = word[i];

           if (!(letter in root.children)) {
               return false
           } 
            root = root.children[letter]   
       }
       return root.isTerminal
   }

   wordsWithPrefix(prefix, root = this.root) {
       if (prefix.length === 0) {
           let res = [];
           if (root.isTerminal) {
               res.push("")
            }

            for (let letter in root.children) {
                let child = root.children[letter]
                let suffixes = this.wordsWithPrefix(prefix, child);
                let words = suffixes.map(suffix => letter + suffix);
                res.push(...words)
            }
            return res;
            
       } else {
           let letter = prefix[0];
           let child = root.children[letter];
           if (child === undefined) {
               return [];
           } else {
               let suffixes = this.wordsWithPrefix(prefix.slice(1), root.children[letter]);
               let words = suffixes.map(suffix => letter + suffix)
               return words
           }
 
       }
   }
}

module.exports = {
    Node,
    Trie
};