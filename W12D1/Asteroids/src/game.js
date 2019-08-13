const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js"); 

function Game() {
    this.DIM_X = 800;
    this.DIM_Y = 800;
    this.NUM_ASTEROIDS = 10;
    this.asteroids = [];

    this.addAsteroids(this.NUM_ASTEROIDS);
    this.ship = new Ship(this.randomPosition(), this);

}

Game.prototype.addAsteroids = function(number) {
  
    while (this.asteroids.length < number) {
        let newAsteroid = new Asteroid(this.randomPosition(), this);
        this.asteroids.push(newAsteroid);
    }
    // debugger
}

Game.prototype.randomPosition = function() {
    return [(Math.floor(Math.random() * this.DIM_X) + 1), (Math.floor(Math.random() * this.DIM_Y) + 1)]
}

Game.prototype.draw = function (ctx) {

    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, this.DIM_X, this.DIM_Y);

    let allObject = this.allObjects();

    for (let i = 0; i < allObject.length; i++) {
        allObject[i].draw(ctx);
    } 
}

Game.prototype.moveObjects = function(ctx) {

    let allObject = this.allObjects();

    for (let i = 0; i < allObject.length; i++) {
        allObject[i].move(ctx);

    // debugger
  }
}

Game.prototype.wrap = function(pos) {
    if (pos[0] > 800){
        pos[0] = 0;
    } else if (pos[0] < 0) {
        pos[0] = 800;
    }

    if (pos[1] > 800) {
        pos[1] = 0;
    } else if (pos[1] < 0) {
        pos[1] = 800;
    }
    return pos;
}

Game.prototype.checkCollisions = function() {

    let allObject = this.allObjects();

    for (let i = 0; i < allObject.length - 1; i++) {
        for (let j = i + 1; j < allObject.length; j++) {
            if (allObject[i].isCollideWith(allObject[j])) {
                // alert("COLLISION!")
                // this.remove(this.asteroids[i]);
                // this.remove(this.asteroids[j]);
            }
        }
    }
}

Game.prototype.step = function(ctx) {
    this.moveObjects(ctx);
    this.checkCollisions();
}


Game.prototype.remove = function(asteroid) {
    
    let index = this.asteroids.indexOf(asteroid);
    this.asteroids.splice(index, 1);
}


Game.prototype.allObjects = function() {
    return this.asteroids.concat(this.ship)
}




module.exports = Game;