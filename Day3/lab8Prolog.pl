/* Function to calculate factorial */
factorial(0, 1).
factorial(Number, Result) :-
    Number > 0,
    Next is Number - 1,
    factorial(Next, SubResult),
    Result is Number * SubResult.

/* Function to take input */
factorial_input :-
    write('Enter a Number: '),
    read(N),
    factorial(N, Result),
    write('Factorial of '), write(N), write(' = '), write(Result), nl.