[
    (
            not print(num, end=':') and
            (print("fizzbuzz") if fizzed and buzzed
             else (print("fizz") if fizzed
                   else (print("buzz") if buzzed
                         else print())))) for
    num in range(1, 101) if
    (fizzed := not num % 3) and False or (buzzed := not num % 5) or True
]
