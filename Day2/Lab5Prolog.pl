/* Ann hates white. */
hates(ann, white).

hates(Person, Color) :- \+ (dress(Person, Color), shoes(Person, Color)).
hates(Person, Color) :- \+ dress(Person, Color).
hates(Person, Color) :- \+ shoes(Person, Color).

\+ hates(Person, Color) :- (dress(Person, Color), shoes(Person, Color)).
