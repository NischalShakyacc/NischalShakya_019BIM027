class WaterJugProblem:
    def __init__(self, jug1_capacity, jug2_capacity, target_amount):
        self.jug1_capacity = jug1_capacity
        self.jug2_capacity = jug2_capacity
        self.target_amount = target_amount
        self.current_state = {'jug1': 0, 'jug2': 0}
        self.visited_states = set()

    def fill_jug1(self):
        return {'jug1': self.jug1_capacity, 'jug2': self.current_state['jug2']}

    def fill_jug2(self):
        return {'jug1': self.current_state['jug1'], 'jug2': self.jug2_capacity}

    def pour_jug1_to_jug2(self):
        pour_amount = min(self.current_state['jug1'], self.jug2_capacity - self.current_state['jug2'])
        return {'jug1': self.current_state['jug1'] - pour_amount, 'jug2': self.current_state['jug2'] + pour_amount}

    def pour_jug2_to_jug1(self):
        pour_amount = min(self.current_state['jug2'], self.jug1_capacity - self.current_state['jug1'])
        return {'jug1': self.current_state['jug1'] + pour_amount, 'jug2': self.current_state['jug2'] - pour_amount}

    def is_goal_state(self, state):
        return state['jug1'] == self.target_amount or state['jug2'] == self.target_amount

    def move(self, state):
        moves = [
            self.fill_jug1(),
            self.fill_jug2(),
            self.pour_jug1_to_jug2(),
            self.pour_jug2_to_jug1()
        ]

        return [{'new_state': move, 'action': next(key for key, value in move.items() if value != state[key])}
                for move in moves]

    def plan(self):
        stack = [{'state': self.current_state, 'actions': []}]
        self.visited_states.add(str(self.current_state))

        while stack:
            current_state = stack.pop()

            if self.is_goal_state(current_state['state']):
                return current_state['actions']

            possible_moves = self.move(current_state['state'])
            for move in possible_moves:
                new_state_string = str(move['new_state'])
                if new_state_string not in self.visited_states:
                    stack.append({'state': move['new_state'], 'actions': current_state['actions'] + [move['action']]})
                    self.visited_states.add(new_state_string)

        return None

water_jug_problem = WaterJugProblem(3, 4, 2)
plan = water_jug_problem.plan()
print(plan)