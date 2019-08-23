module.exports = {
    fetchTodos () {
        return $.ajax({
        method: "GET",
        url: "api/todos"
        });
    },

    createTodo(todo) {
        return $.ajax({
            method:"POST",
            url: "api/todos",
            data: {todo: todo}
        })
    }
}






