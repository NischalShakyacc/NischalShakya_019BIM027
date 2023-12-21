likes(john, ai).
likes(john, cs).
:- discontiguous likes/2.
likes(sara, ai).
dislikes(sara, cs).
likes(jack, X) :- likes(sara, X).