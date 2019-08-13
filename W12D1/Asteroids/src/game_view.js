function GameView(game, ctx) {
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    setInterval(this.game.step.bind(this.game), 20, this.ctx);
    setInterval(this.game.draw.bind(this.game), 20, this.ctx);
    
}

module.exports = GameView;