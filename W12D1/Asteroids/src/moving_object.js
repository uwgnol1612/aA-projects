function MovingObject(object, game) {
    this.pos = object['pos'];
    this.vel = object['vel'];
    this.radius = object['radius'];
    this.color = object['color'];
    this.game = game; 
}

MovingObject.prototype.draw = function(ctx) {

    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2);
    ctx.strokeStyle = "black";
    ctx.stroke();
    ctx.fillStyle = `${this.color}`
    ctx.fill();

}

MovingObject.prototype.move = function(ctx) {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];

    this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isCollideWith = function(otherObject) {
    let radii = this.radius + otherObject.radius;
    let dis = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)
    return (radii > dis);

}

MovingObject.prototype.collideWith = function() {
    
}


module.exports = MovingObject;