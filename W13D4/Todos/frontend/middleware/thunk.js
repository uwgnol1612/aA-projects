const thunk = (store) => next => action => {
    if ( typeof action === "function" ) {
        return action(store.dispatch)
    } else {
        return next(action);   
    }
}

window.thunk = thunk;

export default thunk;