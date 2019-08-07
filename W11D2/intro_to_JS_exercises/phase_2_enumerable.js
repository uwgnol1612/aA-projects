Array.prototype.myEach = function (cb) {
    for (let i = 0; i < this.length; i++) {
        cb(this[i]);
    }
}


Array.prototype.myMap = function (cb) {
    let results = [];
    this.myEach(el => {
        results.push(cb(el));
    });
    return results;
}


Array.prototype.myReduce = function (cb, initialValue) {
    let acc = 0;
    if (typeof initialValue === "undefined") {
        acc = this[0];
        this.slice(1).myEach(el => {
            acc = cb(acc, el);
        });
    } else {
        acc = initialValue;
        this.myEach(el => {
            acc = cb(acc, el);
        });
    };
    return acc;
};