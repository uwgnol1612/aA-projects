const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

function Asteroid(pos, game) {
  this.COLOR = "#d3d3d3";
  this.RADIUS = 20;
  this.pos = pos;
  this.game = game;

  const arg = { pos: this.pos, vel: Util.randomVec(3), radius: this.RADIUS, color: this.COLOR};
    // debugger
  return new MovingObject(arg, game);
}


Asteroid.prototype.collideWidth = function (otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  }
}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;

// new Asteroid({ pos: [60, 60] });