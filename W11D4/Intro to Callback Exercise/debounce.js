Function.prototype.myThrottle = function(interval) {
  let tooSoon = false;
  return (...args) => {
    if (!tooSoon) {
      tooSoon = true;
      setTimeout(() => tooSoon = false, interval);
      this(...args);
    }
  }
}


Function.prototype.myDebounce = function(interval) {
    let timeout;
    return (...args) => {
        const func = () => {
            timeout = null;
            this(...args);
        }
     clearTimeout(timeout);
     timeout = setTimeout(func, interval);
        
    }
   
}