/*Facts*/
edge(s, a).
edge(s, b).
edge(a, c).
edge(a, e).
edge(b, e).
edge(e, g).

/*Rules*/
path(X, Y) :- edge(X, Y).
path(X, Y) :- edge(X, A) , path(A, Y).

showpath(X, Y, Path) :- edge(X, Y), Path = [X,Y].
showpath(X, Y, Path) :- edge(X, Z), showpath(Z, Y, Path1), Path = [X | Path1].