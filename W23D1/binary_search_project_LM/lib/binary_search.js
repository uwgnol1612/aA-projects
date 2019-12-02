function binarySearch(array, target) {
    if (array.length === 0) {
        return false 
    }
    let midIndex = Math.floor(array.length / 2);
    let left = array.slice(0, midIndex);
    let right = array.slice(midIndex + 1);

    if (array[midIndex] > target) {
        return binarySearch(left, target);
    } else if (array[midIndex] < target) {
        return binarySearch(right, target);
    } else {
        return true;
    }
}

function binarySearchIndex(array, target) {
    if (array.length === 0) {
        return -1
    }

    let midIndex = Math.floor(array.length / 2);
    let left = array.slice(0, midIndex);
    let right = array.slice(midIndex + 1);

    if (array[midIndex] === target) {
        return midIndex
    } else if (array[midIndex] > target) {
        return binarySearchIndex(left, target)
    } else {
        let res = binarySearchIndex(right, target)
        return res === -1 ? -1 : midIndex + res + 1
    }

}


module.exports = {
    binarySearch,
    binarySearchIndex
};