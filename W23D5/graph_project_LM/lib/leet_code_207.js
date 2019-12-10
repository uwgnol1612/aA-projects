// View the full problem and run the test cases at:
//  https://leetcode.com/problems/course-schedule/

function canFinish(numCourses, prerequisites) {
    let graph = buildGraph(prerequisites)
    let courseNum = Object.keys(graph).length
    let completed = new Set()

    let courseExist = true;

    while (courseExist) {
        elegibleCourseExist = false;
        for (let course in graph) {
        let preqMeet = graph[course].every(pre => completed.has(pre))
        if (!completed.has(course) && preqMeet ) {
            completed.add(course)
            courseExist = true;
        }
    }

    }

    return completed.size === courseNum

}

function buildGraph(prerequisites) {
    let graph = {}
    prerequisites.forEach(preq => {
        let [course, pre] = preq.map(String)
        if (course in graph) {
            graph[couse].push(pre)
        } else {
            graph[course] = [ pre ]
        }

        if (!(pre in graph)) {
            graph[pre] = []
        }
    })
    return graph;
}

