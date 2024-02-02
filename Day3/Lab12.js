function waterJugBFS(jugA, jugB, target) {
    // This 2D array is used as a hashmap
    // to keep track of already visited
    // values and avoid repetition
    let visited = new Array(1000);
    for (let i = 0; i < 1000; i++) {
        visited[i] = new Array(1000);
        for (let j = 0; j < 1000; j++) {
            visited[i][j] = -1;
        }
    }

    let isSolvable = false;
    let path = [];

    let queue = []; // Queue to maintain states
    queue.push([0, 0]); // Initializing with initial state

    while (queue.length !== 0) {
        let currentState = queue[0]; // Current state
        queue.shift(); // Pop off used state

        // Check if the current state meets jug constraints
        if (currentState[0] > jugA || currentState[1] > jugB || currentState[0] < 0 || currentState[1] < 0) {
            continue;
        }

        // Check if this state is already visited
        if (visited[currentState[0]][currentState[1]] > -1) {
            continue;
        }

        // Fill the vector for constructing the solution path
        path.push([currentState[0], currentState[1]]);

        // Mark the current state as visited
        visited[currentState[0]][currentState[1]] = 1;

        // If we reach the solution state, set isSolvable to true
        if (currentState[0] === target || currentState[1] === target) {
            isSolvable = true;
            if (currentState[0] === target) {
                if (currentState[1] !== 0) {
                    // Fill the final state
                    path.push([currentState[0], 0]);
                }
            } else {
                if (currentState[0] !== 0) {
                    // Fill the final state
                    path.push([0, currentState[1]]);
                }
            }

            // Print the solution path
            let size = path.length;
            for (let i = 0; i < size; i++) {
                console.log("(" + path[i][0] + ", " + path[i][1] + ")");
            }
            break;
        }

        // If we have not reached the final state
        // then, start developing intermediate
        // states to reach the solution state
        queue.push([currentState[0], jugB]); // Fill JugB
        queue.push([jugA, currentState[1]]); // Fill JugA

        for (let pourAmount = 0; pourAmount <= Math.max(jugA, jugB); pourAmount++) {
            // Pour amount from JugB to JugA
            let pourJugBtoJugA = [currentState[0] + pourAmount, currentState[1] - pourAmount];

            // Check if this state is possible or not
            if (pourJugBtoJugA[0] === jugA || (pourJugBtoJugA[1] === 0 && pourJugBtoJugA[1] >= 0)) {
                queue.push(pourJugBtoJugA);
            }

            // Pour amount from JugA to JugB
            let pourJugAtoJugB = [currentState[0] - pourAmount, currentState[1] + pourAmount];

            // Check if this state is possible or not
            if ((pourJugAtoJugB[0] === 0 && pourJugAtoJugB[0] >= 0) || pourJugAtoJugB[1] === jugB) {
                queue.push(pourJugAtoJugB);
            }
        }

        queue.push([jugA, 0]); // Empty JugB
        queue.push([0, jugB]); // Empty JugA
    }

    // No solution exists if isSolvable is false
    if (!isSolvable) {
        console.log("No solution");
    }
}

// Driver code
let jug1Capacity = 4, jug2Capacity = 3, target = 2;
console.log("Path from initial state to solution state :");
waterJugBFS(jug1Capacity, jug2Capacity, target);
