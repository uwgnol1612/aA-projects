const DOMNodeCollection = require('./dom_node_collection');

const queue = [];

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and parsed');
    queue.forEach(func => {
        func();
    });
});

function $l (el) {
    if (typeof el === "function") {
        queue.push(el);
    }
    else if (el instanceof HTMLElement) {
        return new DOMNodeCollection(Array.from(el));
    } else {
        const elements = document.querySelectorAll(el);
        return new DOMNodeCollection(Array.from(elements));
    }
};

$l.extend = function (...args) {
    const first = args[0];
    args = args.slice(1);
    args.forEach(arg => {
        const keys = Object.keys(arg);
        keys.forEach(key => {
            first[key] = arg[key];
        })
    })
    return first;
};

$l.ajax = function(obj) {
    //step 1 - create xhr object
    const xhr = new XMLHttpRequest();
    
    const defaults = {
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    method = "GET",
    url = "",
    success: ()=> {},
    error: ()=> {}
    data: {},

    };

    // if (options.method === "GET") {
    //     options.url += `?${toQueryString(options.data)}`;
    // }

    options = $l.extend(defaults, options);
    options.method = options.method.toUpperCase();

    // step 2 - specify path and verb
    xhr.open(options.method, options.url, true);  
    // step 3 - register a callback
    xhr.onload = (e) => {
        if (xhr.status === 200) {
            options.success(xhr.response);
        } else {
            options.error(xhr.response);
        }
    };

    xhr.send(JSON.stringify(options.data));   
}

// toQueryString = (obj) => {
//     let result = "";
//     for (const prop in obj) {
//         if (Object.prototype.hasOwnProperty.call(obj, prop)) {
//             result += `${prop}=${obj[prop]}&`;
//         }
//     }
//     return result.substring(0, result.length - 1);
// };


window.$l = $l;