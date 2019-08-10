function Surrogate() {
    
}

Function.prototype.inherits = function(parent) {
    Surrogate.prototype = parent.prototype;
    this.prototype = new Surrogate;
    this.prototype.constructor = this;
}

function MovingObject () {

}

MovingObject.prototype.something = function () {
    console.log("something")
}

function Ship () {}
Ship.inherits(MovingObject);


function Asteroid () {}
Asteroid.inherits(MovingObject);


// Surrogate.prototype = SuperClass.prototype;
// SubClass.prototype = new Surrogate();
// SubClass.prototype.constructor = Subclass;
