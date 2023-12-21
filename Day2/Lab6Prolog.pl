/*child(charlesI, jamesI).
child(elizabeth, jamesI).
child(catherine, charlesI).
child(charlesII, charlesI).
child(jamesII, charlesI).
child(sophia, elizabeth).
child(georgeI, sophia).

grandparent(GP, GC) :- child(GC, P), child(P, GP).
*/

/*
(child(X, Y) :- parent(Y, X)) :- (grandparent(Z,X) :- parent(Z,Y)).
*/

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