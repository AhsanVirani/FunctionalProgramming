# Squaring a number

# Pure function : int -> int
def square(num: int) -> int:
    return num * num

print("Pure Function: ")
print(square(square(2)))
print()

# Introducing a side-effect by using print within function. Print is (I/O) hence impure
def square_with_print(num: int) -> int:
    print("Current num: ", num)
    return num * num

print("Impure Function: ")
print(square_with_print(square_with_print(2)))
print()

# Solution? Compose logs in output to make function pure
def square_with_print_return(num: int) -> (int, str):
    logs = "Current num " + str(num)
    return (num * num, logs)

# Note that we can't chaim these functions because return type is a tuple
# We need a compose function to handle the chaining
def compose(func2, func1, num: int):
    res1 = func1(num)
    res2 = func2(res1[0])

    return (res2[0], res1[1] + " " + res2[1])

print(compose(square_with_print_return, square_with_print_return, 2))

# Problem. What if we want to chain 3 functions together? Clearly its not scalable. What do we do?

# Solution: A scalable wrapper function that knows how to handle "side-effects"without changing function definition
from typing import Tuple
def bind(func, tuple: Tuple[int, str]):
    res = func(tuple[0])
    return (res[0], tuple[1] + " " + res[1])

# First parameter is tuple so we need a way to convert num to tuple
def unit(num: int):
    return (num, "")

print(bind(square_with_print_return, (bind(square_with_print_return, unit(2)))))

# So mondads are beautiful and generic way of handling side effects in pure functions and provide a scalable approach for composing pure functions by using bind and uni concepts.
