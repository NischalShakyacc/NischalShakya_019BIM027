add:-
    write('Enter first number: '),
    read(N1),
    write('Enter second number: '),
    read(N2),
    Sum is N1 + N2,
    format('Sum of ~w and ~w is ~w: ',[N1,N2,Sum]).

subtract:-
    write('Enter first number: '),
    read(N1),
    write('Enter second number: '),
    read(N2),
    Difference is N1 - N2,
    format('Difference of ~w and ~w is ~w: ',[N1,N2,Difference]).

multiply:-
    write('Enter first number: '),
    read(N1),
    write('Enter second number: '),
    read(N2),
    Product is N1 * N2,
    format('Product of ~w and ~w is ~w: ',[N1,N2,Product]).

division:-
    write('Enter first number: '),
    read(N1),
    write('Enter second number: '),
    read(N2),
    Quotient is N1 / N2,
    format('Quotient of ~w and ~w is ~w: ',[N1,N2,Quotient]).

even(Number):-
    0 is Number mod 2.

check_even_odd:-
    write('Enter a number: '),
    read(Number),
    (
        even(Number),
        format('Number ~w is even.',[Number]);
        format('Number ~w is odd.',[Number])
    ).