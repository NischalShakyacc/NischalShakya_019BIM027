
act(state(middle, onbox, middle, hasnot),
    grasp,
    state(middle, onbox, middle, has) ).

act(state(P, onfloor, P, H),
    climb,
    state(P, onbox,   P, H) ).

act(state(P1, onfloor, P1, H),
    push(P1, P2),
    state(P2, onfloor, P2, H) ).

act(state(P1, onfloor, B, H),
    walk(P1, P2),
    state(P2, onfloor, B, H) ).


canget(state(_, _, _, has)).
canget(State1) :- act(State1, _, State2), canget(State2).

go :- canget(state(atdoor, onfloor, atwindow, hasnot)).
