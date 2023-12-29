parent(jamesI, charlesI).
parent(jamesI, elizabeth).
parent(charlesI, catherine).
parent(charlesI, charlesII).
parent(charlesI, jamesII).
parent(elizabeth, sophia).
parent(sophia, georgeI).

/*Grandparent Rule*/
grandparent(GP, GC) :- parent(P, GC), parent(GP, P).

/* Child Parent Relation */
child(X,Y) :- parent(Y,X).

/* Sibling */
siblings(S, D) :- parent(P, S), parent(P, D).

/* Brother Sister */
brothersister(S, D) :- siblings(X, Y), parent(X, S), parent(Y, D).

list_siblings(Person, Siblings) :-
    findall(Sibling, (siblings(Person, Sibling), Person \= Sibling), Siblings).

list_brothers_sisters(Person, BrothersSisters) :-
    findall(BrothersSister, (brothersister(Person, BrothersSister), Person \= BrothersSister), BrothersSisters).
