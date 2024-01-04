/* Ann hates white. */

/*
hates(ann, white).

hates(Person, Color) :- \+ (dress(Person, Color), shoes(Person, Color)).
hates(Person, Color) :- \+ dress(Person, Color).
hates(Person, Color) :- \+ shoes(Person, Color).
\+ hates(Person, Color) :- (dress(Person, Color), shoes(Person, Color)).
*/

hates(ann, white).

doesNotWearColor(Person, Color) :- hates(Person, Color), \+ wearsShoesOrDress(Person, Color).

wearsShoesOrDress(Person, Color) :- shoes(Person, Color).
wearsShoesOrDress(Person, Color) :- dress(Person, Color).

shoes(susan, X) :- dress(susan, X).
shoes(alice, white).
shoes(alice, ColorY) :- dress(alice, ColorZ), ColorY \= ColorZ.
shoes(ann, ColorY) :- dress(ann, ColorZ), ColorY \= ColorZ.


