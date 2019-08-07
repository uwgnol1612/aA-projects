const range = function (start, end) {
    if (end === start) {
        return [start];
    }
    let array = range(start, end - 1);
    array.push(end);
    return array;
}

function sumRec(array) {
    if (array.length === 1) {
        return array[0];
    };
    let total = array[0] + sumRec(array.slice(1));
    return total;
}

function exp(base, exponent) {
    if (exponent === 0) {
        return 1;
    }
    return base * exp(base, exponent - 1);
}

function exp2(base, exponent) {
    if (exponent === 0) {
        return 1;
    };
    if (exponent === 1) {
        return base;
    };
    if (exponent % 2 === 0) {
        return exp2(base, exponent / 2) ** 2;
    } else {
        return base * (exp2(base, (exponent - 1) / 2) ** 2);
    };
}

function fibonnaci(n) {
    if (n === 0) {
        return [];
    }
    if (n === 1) {
        return [1];
    }
    if (n === 2) {
        return [1, 1];
    }

    let array = fibonnaci(n - 1);
    let lastTwo = array.slice(-2);
    let nextEle = lastTwo.reduce((a, b) => a + b);
    array.push(nextEle);
    return array;
}

function deepDupe(array) {
    if (array.length <= 1) {
        return array;
    }
    let duplicate = [];
    array.forEach(el => {
        if (typeof el === (Array)) {
            duplicate.concat(deepDupe(el));
        } else {
            duplicate.push(el);
        };
    });
    return duplicate;
}


function bsearch(arr, target) {
    if (arr.length === 0) {
        return -1
    }

    let midIndex = Math.floor(arr.length / 2)
    let midNum = arr[midIndex]

    if (target === midNum) {
        return midIndex; 
    } else if (target < midNum) {
        let left = arr.slice(0, midIndex);
        return bsearch(left, target);
    } else {
        let right = arr.slice(midIndex+1, arr.length);
        let res = bsearch(right, target);
        if (res === -1) {
            return -1;
        } else {
            return res + midIndex + 1;
        };
    };

}

function mergesort(arr) {
    if (arr.length < 2) {
        return arr;
    }

    let mid = Math.floor(arr.length / 2);
    let left = arr.slice(0, mid);
    let right = arr.slice(mid, arr.length);

    let sortedLeft = mergesort(left);
    let sortedRight = mergesort(right);

    return merge(sortedLeft, sortedRight);
}


function merge(left, right) {

    let merged = [];

    while (left[0] && right[0]) {
        if (left[0] < right[0]) {
            merged.push(left.shift());
        } else {
            merged.push(right.shift());
        };
    } 

   return merged.concat(left, right);
}


function subsets(arr) {
    let newArray = [];
    for (let i = 0; i < arr.length; i++) {
        for (let j = i+1; j <= arr.length; j++) {
            newArray.push(arr.slice(i,j))
        };
    };
    return newArray;
}

