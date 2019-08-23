
export const allTodos = (state) => (
    Object.keys(state.todos).map(index => state.todos[index])
)


window.allTodos = allTodos;

