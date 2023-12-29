/*in_room(bananas).
in_room(chair).
in_room(monkey).

clever(monkey).
can_climb(monkey, chair).
tall(chair).

can_move(X, Y, Z) :-
    in_room(X),
    in_room(Y),
    in_room(Z),
    can_climb(X, Y),
    can_climb(Y, Z).

can_reach(X, Y) :- clever(X), close_to(X, Y).
get_on(X, Y) :- can_climb(X, Y).
under(X, Y, Z) :- in_room(X), in_room(Y), in_room(Z), can_climb(X, Y), can_climb(Y, Z).

close_to(X, Z) :- can_climb(X, Y), under(Y, Z).
*/

in_room(bananas).
in_room(chair).
in_room(monkey).

clever(monkey).
can_climb(monkey, chair).
tall(chair).



can_move(monkey, chair, bananas).

can_reach(X, Y) :- clever(X), close(X, Y).

get_on(X, Y) :- can_climb(X, Y).

under(X, Y, Z) :- in_room(X), in_room(Y), in_room(Z), can_climb(X, Y, Z).

close(X, Z) :- get_on(X, Y), under(Y, Z).
close(X, Z) :- tall(Y), under(Y, Z).