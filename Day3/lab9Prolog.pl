/* Base case: Fibonacci of 0 is 0 */
fibonacci(0, 0).

/* Base case: Fibonacci of 1 is 1 */
fibonacci(1, 1).

/*Recursive rule for Fibonacci*/
fibonacci(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, Fib1),
    fibonacci(N2, Fib2),
    Result is Fib1 + Fib2.
    