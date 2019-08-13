const Util = require("./util.js");
const MovingObject = require("./moving_object.js");


function Ship(pos, game) {
    this.RADIUS = 20;
    this.COLOR = "#800080";
    this.vel = [0, 0];
    this.pos = pos;
    this.game = game;

    const arg = { pos: this.pos, vel: this.vel, radius: this.RADIUS, color: this.COLOR };

    return new MovingObject(arg, game);
}

Ship.prototype.relocate = function() {
    this.pos = this.game.randomPosition();
    this.vel = [0, 0];
}



Util.inherits(Ship, MovingObject);


module.exports = Ship;

