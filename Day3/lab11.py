# Define the initial state
initial_state = {'monkey': 'A', 'box': 'B', 'banana': 'C'}

# Define the goal state
goal_state = {'monkey': 'C', 'box': 'C', 'banana': 'C'}

def move(state, action):
    """Perform a move based on the action."""
    new_state = state.copy()

    if action == 'walk':
        if state['monkey'] == 'A':
            new_state['monkey'] = 'B'
        elif state['monkey'] == 'B':
            new_state['monkey'] = 'C'
        elif state['monkey'] == 'C':
            new_state['monkey'] = 'A'
    elif action == 'climb':
        if state['monkey'] == state['box']:
            new_state['monkey'] = 'on_box'
    elif action == 'push':
        if state['monkey'] == state['box']:
            if state['box'] == 'A':
                new_state['box'] = 'B'
            elif state['box'] == 'B':
                new_state['box'] = 'C'
            elif state['box'] == 'C':
                new_state['box'] = 'A'
    elif action == 'jump':
        if state['monkey'] == 'on_box':
            new_state['monkey'] = state['box']
    
    return new_state

def goal_test(state):
    """Check if the current state is the goal state."""
    return state == goal_state

def monkey_banana_problem():
    """Solve the Monkey and Banana problem."""
    current_state = initial_state
    actions = ['walk', 'climb', 'push', 'jump']

    while not goal_test(current_state):
        print(f"Current state: {current_state}")
        print("Available actions:", actions)

        action = input("Enter action: ").lower()

        if action not in actions:
            print("Invalid action. Please choose from the available actions.")
            continue

        current_state = move(current_state, action)

    print("Goal reached! The monkey has the banana.")

if __name__ == "__main__":
    monkey_banana_problem()
