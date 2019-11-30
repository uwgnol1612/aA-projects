function merge(array1, array2) {
    let merged = [];
    
    while (array1.length || array2.length) {
        let ele1 = array1.length ? array1[0] : Infinity;
        let ele2 = array2.length ? array2[0] : Infinity;

        if (ele1 < ele2) {
            merged.push(array1.shift())
        } else {
            merged.push(array2.shift())
        }
    }
    return merged;

}

function mergeSort(array) {
    if (array.length <= 1) {
        return array;
    }

    let midIndex = Math.floor(array.length / 2);
    let left = array.slice(0, midIndex);
    let right = array.slice(midIndex);

    let sortedLeft = mergeSort(left);
    let sortedRight = mergeSort(right);

    return merge(sortedLeft, sortedRight);

}

module.exports = {
    merge,
    mergeSort
};