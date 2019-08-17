let toDoList;
if (localStorage.getItem("toDoList")) {
    toDoList = JSON.parse(localStorage.getItem("toDoList"));
}
else {
    toDoList = [];
}
let toDoUl = document.getElementsByClassName('todos')[0];
const toDoForm = document.getElementsByClassName('add-todo-form')[0];

populateList(toDoList);

function addToDo (event) {
    event.preventDefault();
    
    let toDoItem = document.getElementsByName('add-todo')[0];
    const toDo = new Object ();
    toDo.value = toDoItem.value;
    toDo.done = false
    toDoList.push(toDo);
    localStorage.setItem("toDoList", JSON.stringify(toDoList))
    toDoItem.value = ""
    populateList(toDoList);
    // debugger
}
   

function populateList (toDoList) {
    toDoUl.innerHTML = ""
    for (let i = 0; i < toDoList.length; i++) {
        const toDoLabel = document.createElement('label');
        toDoLabel.innerHTML = toDoList[i].value;
        const checkBox = document.createElement('input')
        checkBox.type = "checkbox"
        checkBox.checked = toDoList[i].done;
        toDoLabel.appendChild(checkBox);
        const toDoLi = document.createElement('li');
        toDoLi.appendChild(toDoLabel);
        toDoUl.appendChild(toDoLi);
        // debugger
    }
}



toDoForm.addEventListener('submit', addToDo);

// toDoUl.addEventListener('click', e => {
//         if (!e.target.matches)
//         let text = e.target.parentNode.innerHTML;
//         toDoList.forEach(el => {
//             if (el.value === text) {
//                 el.done = true;
//             }
//         })
        
//     localStorage.setItem("toDoList", JSON.stringify(toDoList))
// })