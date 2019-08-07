Array.prototype.uniq = function () {
    let newArray = [];
    this.forEach(el => {
        if (!newArray.includes(el)) {
            newArray.push(el);
        };
    });
  
    return newArray;
};

// [1, 2, 3, 3, 3, 4, 4, 5].uniq();

Array.prototype.twoSum = function () {
    let posArray = [];
    
    
    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                posArray.push([i, j]);
            };
        };
    };
    console.log(posArray);
    return posArray;
};

// [1, -1, 2, 3, -3, 4, 5, 6, -6].twoSum();

// [[1, 2, 3], [4, 5, 6], [7, 8, 9]] => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

Array.prototype.transpose = function () {
    let newArray = [];
    // let subArr = [];
    for (let i = 0; i < this.length; i++) {
        let subArr = [];
        for (let j = 0; j < this[i].length; j++) {
            subArr.push(this[j][i]);
        };
        newArray.push(subArr);
    };
    return newArray;
};
// [[1, 2, 3], [4, 5, 6], [7, 8, 9]].transpose();





