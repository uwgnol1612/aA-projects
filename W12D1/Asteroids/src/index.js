const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");


window.MovingObject = MovingObject;

console.log("Webpack is working!")

document.addEventListener("DOMContentLoaded", function() {
    const canvas = document.getElementById('game-canvas');
    canvas.width = 800;
    canvas.height = 800;

    

    const ctx = canvas.getContext('2d');

    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    let game = new Game();


    let gameview = new GameView(game, ctx);
    gameview.start();


});



