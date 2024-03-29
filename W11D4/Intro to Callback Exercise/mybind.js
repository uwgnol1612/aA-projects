Function.prototype.myBind = function (context) {
  return () => this.apply(context);
};

Function.prototype.myBindA = function (context, ...binded) {
  return (...callArgs) => {return this.apply(context, binded.concat(callArgs));
  };
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function () {
  console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"