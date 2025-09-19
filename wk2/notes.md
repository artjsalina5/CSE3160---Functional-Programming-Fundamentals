# Recursive Functions in Functional Programming

## Process for Writing Recursive Functions

1. Name The Function
2. Write Down its Type
3. Enumerate the Cases
4. Define the Simple Cases
5. List the "Ingredients"
6. Define the Other Cases
7. Think About the Solution

### Example One

- Adapt the function so that it computes the sum of the first n even numbers.
E.g., the sum of the first four even is 2+4+6+8=20
Your function should be called sumEVEN and take n as input.

  1 Name the Function
  - `sumSQ`
  2 Write down its type
    `sumEVEN :: (Eq t, Num t) => t -> t`
  3 Enumerate the Cases
    `sumEVEN = 0`
    `sumEVEN n = n*2 sumEVEN (n - 1)`

### Example Two

Write a recursive function that, given a positive integer k
, computes the product 1⋅(1−1/2)(1−1/3)⋯(1−1/k)
Your function should be called hProd, take k as an input and return a Double.

1. Name the function:
  `hProd`
2. Write down its type
  `hProd :: (Fractional a, Integral t) => t -> a`
