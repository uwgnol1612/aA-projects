const mySum = function(...args) {
    let sum = 0;
    for (let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    return sum;
}

// console.log(mySum(1, 2, 3, 4) === 10);
// console.log(mySum(1, 2, 3, 4, 5) === 15);



Function.prototype.myBind = function(ctx, ...callargs) {
    return ((...bindArgs) => { 
        return this.apply(ctx, callargs.concat(bindArgs))
    });

}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// console.log(markov.says("meow", "Ned"))
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args

// console.log(markov.says.myBind(pavlov, "meow", "Kush")())
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// console.log(markov.says.myBind(pavlov)("meow", "a tree"))
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// console.log(markov.says.myBind(pavlov, "meow")("Markov"))
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);

// console.log(notMarkovSays("meow", "me"))
// // Pavlov says meow to me!
// // true



// function sumThree(num1, num2, num3) {
//    return function (num1){
//       return function (num2){
//          return function (num3){
//             return num1 + num2 + num3;
//          }
//       }
//    }
//  }

function sumThree(num1, num2, num3) {
   return num1 + num2 + num3;
 }

// sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
sumThree.curry(3)(4)(20)(6); // == 30


const curriedSum = function(numArgs) {
    let numbers = [];
    
    const _curriedSum = function(num) {
        numbers.push(num)
        let sum = 0;
        if (numbers.length === numArgs) {
            for (let i = 0; i < numbers.length; i++){
                sum += numbers[i];
            }
            return sum;
        } else {
            return _curriedSum;
        }
        
    }
    return _curriedSum;
}

Function.prototype.curry = function(numArgs){
   let args = [];
//    const that = this
   const iDontKnowWhatThisIs = (arg) => {
      args.push(arg)
         if (args.length === numArgs) {
            return this(...args);
         } else {
            return iDontKnowWhatThisIs;
      }
   }
   return iDontKnowWhatThisIs;
}


// Function.prototype.apply(context, ...args)