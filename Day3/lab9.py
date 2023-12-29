def fibonacci(N):
    print(f'The fibonacci series upto {N} is as follows:')
    if N >= 1:
        print(0)
    if N >= 2:
        print(1)
    
    a, b = 0, 1
    for _ in range(N-2):
        c = a + b
        print(c)
        a, b = b, c

numberOfOutput = int(input('Enter a Number: '))
fibonacci(numberOfOutput)