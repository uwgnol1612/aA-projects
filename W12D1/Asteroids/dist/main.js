/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\r\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\n\r\nfunction Asteroid(pos, game) {\r\n  this.COLOR = \"#d3d3d3\";\r\n  this.RADIUS = 20;\r\n  this.pos = pos;\r\n  this.game = game;\r\n\r\n  const arg = { pos: this.pos, vel: Util.randomVec(3), radius: this.RADIUS, color: this.COLOR};\r\n    // debugger\r\n  return new MovingObject(arg, game);\r\n}\r\n\r\n\r\nAsteroid.prototype.collideWidth = function (otherObject) {\r\n  if (otherObject instanceof Ship) {\r\n    otherObject.relocate();\r\n  }\r\n}\r\n\r\nUtil.inherits(Asteroid, MovingObject);\r\n\r\n\r\nmodule.exports = Asteroid;\r\n\r\n// new Asteroid({ pos: [60, 60] });\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\r\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\"); \r\n\r\nfunction Game() {\r\n    this.DIM_X = 800;\r\n    this.DIM_Y = 800;\r\n    this.NUM_ASTEROIDS = 10;\r\n    this.asteroids = [];\r\n\r\n    this.addAsteroids(this.NUM_ASTEROIDS);\r\n    this.ship = new Ship(this.randomPosition(), this);\r\n\r\n}\r\n\r\nGame.prototype.addAsteroids = function(number) {\r\n  \r\n    while (this.asteroids.length < number) {\r\n        let newAsteroid = new Asteroid(this.randomPosition(), this);\r\n        this.asteroids.push(newAsteroid);\r\n    }\r\n    // debugger\r\n}\r\n\r\nGame.prototype.randomPosition = function() {\r\n    return [(Math.floor(Math.random() * this.DIM_X) + 1), (Math.floor(Math.random() * this.DIM_Y) + 1)]\r\n}\r\n\r\nGame.prototype.draw = function (ctx) {\r\n\r\n    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\r\n    ctx.fillStyle = \"black\";\r\n    ctx.fillRect(0, 0, this.DIM_X, this.DIM_Y);\r\n\r\n    let allObject = this.allObjects();\r\n\r\n    for (let i = 0; i < allObject.length; i++) {\r\n        allObject[i].draw(ctx);\r\n    } \r\n}\r\n\r\nGame.prototype.moveObjects = function(ctx) {\r\n\r\n    let allObject = this.allObjects();\r\n\r\n    for (let i = 0; i < allObject.length; i++) {\r\n        allObject[i].move(ctx);\r\n\r\n    // debugger\r\n  }\r\n}\r\n\r\nGame.prototype.wrap = function(pos) {\r\n    if (pos[0] > 800){\r\n        pos[0] = 0;\r\n    } else if (pos[0] < 0) {\r\n        pos[0] = 800;\r\n    }\r\n\r\n    if (pos[1] > 800) {\r\n        pos[1] = 0;\r\n    } else if (pos[1] < 0) {\r\n        pos[1] = 800;\r\n    }\r\n    return pos;\r\n}\r\n\r\nGame.prototype.checkCollisions = function() {\r\n\r\n    let allObject = this.allObjects();\r\n\r\n    for (let i = 0; i < allObject.length - 1; i++) {\r\n        for (let j = i + 1; j < allObject.length; j++) {\r\n            if (allObject[i].isCollideWith(allObject[j])) {\r\n                // alert(\"COLLISION!\")\r\n                // this.remove(this.asteroids[i]);\r\n                // this.remove(this.asteroids[j]);\r\n            }\r\n        }\r\n    }\r\n}\r\n\r\nGame.prototype.step = function(ctx) {\r\n    this.moveObjects(ctx);\r\n    this.checkCollisions();\r\n}\r\n\r\n\r\nGame.prototype.remove = function(asteroid) {\r\n    \r\n    let index = this.asteroids.indexOf(asteroid);\r\n    this.asteroids.splice(index, 1);\r\n}\r\n\r\n\r\nGame.prototype.allObjects = function() {\r\n    return this.asteroids.concat(this.ship)\r\n}\r\n\r\n\r\n\r\n\r\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function GameView(game, ctx) {\r\n    this.game = game;\r\n    this.ctx = ctx;\r\n}\r\n\r\nGameView.prototype.start = function() {\r\n    setInterval(this.game.step.bind(this.game), 20, this.ctx);\r\n    setInterval(this.game.draw.bind(this.game), 20, this.ctx);\r\n    \r\n}\r\n\r\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\r\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\r\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\r\n\r\n\r\nwindow.MovingObject = MovingObject;\r\n\r\nconsole.log(\"Webpack is working!\")\r\n\r\ndocument.addEventListener(\"DOMContentLoaded\", function() {\r\n    const canvas = document.getElementById('game-canvas');\r\n    canvas.width = 800;\r\n    canvas.height = 800;\r\n\r\n    \r\n\r\n    const ctx = canvas.getContext('2d');\r\n\r\n    ctx.fillStyle = \"black\";\r\n    ctx.fillRect(0, 0, canvas.width, canvas.height);\r\n\r\n    let game = new Game();\r\n\r\n\r\n    let gameview = new GameView(game, ctx);\r\n    gameview.start();\r\n\r\n\r\n});\r\n\r\n\r\n\r\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(object, game) {\r\n    this.pos = object['pos'];\r\n    this.vel = object['vel'];\r\n    this.radius = object['radius'];\r\n    this.color = object['color'];\r\n    this.game = game; \r\n}\r\n\r\nMovingObject.prototype.draw = function(ctx) {\r\n\r\n    ctx.beginPath();\r\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2);\r\n    ctx.strokeStyle = \"black\";\r\n    ctx.stroke();\r\n    ctx.fillStyle = `${this.color}`\r\n    ctx.fill();\r\n\r\n}\r\n\r\nMovingObject.prototype.move = function(ctx) {\r\n    this.pos[0] += this.vel[0];\r\n    this.pos[1] += this.vel[1];\r\n\r\n    this.pos = this.game.wrap(this.pos);\r\n}\r\n\r\nMovingObject.prototype.isCollideWith = function(otherObject) {\r\n    let radii = this.radius + otherObject.radius;\r\n    let dis = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)\r\n    return (radii > dis);\r\n\r\n}\r\n\r\nMovingObject.prototype.collideWith = function() {\r\n    \r\n}\r\n\r\n\r\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\r\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\n\r\n\r\nfunction Ship(pos, game) {\r\n    this.RADIUS = 20;\r\n    this.COLOR = \"#800080\";\r\n    this.vel = [0, 0];\r\n    this.pos = pos;\r\n    this.game = game;\r\n\r\n    const arg = { pos: this.pos, vel: this.vel, radius: this.RADIUS, color: this.COLOR };\r\n\r\n    return new MovingObject(arg, game);\r\n}\r\n\r\nShip.prototype.relocate = function() {\r\n    this.pos = this.game.randomPosition();\r\n    this.vel = [0, 0];\r\n}\r\n\r\n\r\n\r\nUtil.inherits(Ship, MovingObject);\r\n\r\n\r\nmodule.exports = Ship;\r\n\r\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\r\nconst Util = {\r\n  inherits(childClass, parentClass) {\r\n      Surrogate.prototype = parentClass.prototype;\r\n      childClass.prototype = new Surrogate();\r\n      childClass.prototype.constructor = childClass;\r\n  },\r\n  \r\n  randomVec(length) {\r\n    const deg = 2 * Math.PI * Math.random();\r\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\r\n  },\r\n  // Scale the length of a vector by the given amount.\r\n  scale(vec, m) {\r\n    return [vec[0] * m, vec[1] * m];\r\n  }\r\n\r\n};\r\n\r\nfunction Surrogate() {\r\n}\r\n\r\n\r\n\r\n\r\n\r\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });