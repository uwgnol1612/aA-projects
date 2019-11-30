
function getIntLength(num) {
    return num === 0 ? 1 : Math.floor(Math.log10(Math.abs(num))) + 1
}


function getMaxDigits(arr) {
    let maxDigits = 0;
    for (let i = 0; i < arr.length; i ++) {
        maxDigits = Math.max(maxDigits, getIntLength(arr[i]));
    }
    return maxDigits;
}

function getDigitFrom(num, place) {
    return Math.floor(Math.abs(num) / Math.pow(10, place)) % 10
}


function radixSort(arr) {
    if (!Array.isArray(arr)) {
        return null;
    }

    let maxDigits = getMaxDigits(arr);
    for (let k = 0; k < maxDigits; k++) {
        let buckets = Array.from({length: 10}, () => []);

        for (let i = 0; i < arr.length; i++) {
            let digit = getDigitFrom(arr[i], k);
            buckets[digit].push(arr[i])
        }
        arr = [].concat(...buckets)
    }
    return arr;

}




module.exports = {
    radixSort
};