function Cat(name, owner) {
    this.name = name;
    this.owner = owner;

    this.meow = function() {
        console.log(this.name + ' says "meow!"');
    };
}

Cat.prototype.cuteStatement = function() {
    return `${this.owner} loves ${this.name}`;
};


let cat = new Cat("Jasmine", "Long");

cat.meow = function() {
    console.log(this.name + ' says "Woof!"');
};

