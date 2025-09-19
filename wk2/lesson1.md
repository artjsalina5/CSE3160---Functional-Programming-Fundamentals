## Continuing with Control

Recall the basics. There is

- The Base Case
- The Inductive Case

```hs
> fac n = if n == 0
          then 1 
          else n * fac (n - 1)
> :t fac
fac :: (Eq p, Num p) => p -> p
> fac 5
120
```

Always go to the minion in order to compute the said factorial.

Recursive implementation and inductive computation are the same!

Think about Pixar.

```hs
> fac n = if n == 0 then 1 else n * fac (n-1)
> x = 42
> if x == 42 then 100 else fac (-5)
```

This outputs simply 42

## Pattern Matching

```hs
and a b = if a
          then if b
               then True 
               else False
          else False
```

This is islly so lets clean it up a little bit.

```hs
and a b = if a
          then b 
          else False
```

- This is a truth table. We can use the wildcard operator

```hs
and True True = True
and _    _    = False
```

This is pattern matching, this is not in Python or C++.

When the input comes in it will be matched against the pattern you see.

- Makes case analysis a breeze (less code less bugs)
- Code is shorter
- Code is more readable
- You can pattern match *complex* constructions

## Back to Factorial

- Now let's do it with pattern matching
Factorial

```hs
fac 0 = 1
fac n = n * fac (n - 1)
```

- The first pattern is a constant for the base case of the recursive definition.
- Cases are tried in sequene top-down
- It is shorter than the if-then-else version
- This does **NOT** create a chain of thunks. Why?

## Poll

Imagine, we augment fac's definition as shown below.

```hs
fac 0 = 1
fac n = n * fac (n - 1)
fac (-1) = -1
```

-1 evaluates to the center amount, this is incorrect, the -1 should be in the base cases

## Demo Time

- fac.hs is implemented and tried with values greater and greater.

- The interesting thing of note here is that there seems to be no overflow.

- Conclusion: The haskell compiler infers the type of the answer and chooses the one
which supports infinite numbers.

## Improvement

- We can and should specify the type of the function
- This way we can specify what the expecation is.
- Keep in mind that using the Numeric type is substatially slower (x500) than in register operations

## Type Your Functions

- Not allowed to change types
- There is a reason to put them in. It is for a specific implementation.

## Going back to if-then-else

- We stated
- It can be written as a function

 ```hs
if' True te _ = te
if' _    _ ee = ee
```

- Could we implement this as a method in python?

  - The answer is No! Why?

    - Because Python is not Lazy. It will evaluate both cases *eagerly*

    ```hs
    fac :: Integer -> Integer
    fac n = if' (n==0) 1 (n * fac (n - 1))
    ```

## Comparing Some Other Languages

```c
#include <stdio.h>
#include <stdlib.h>
int fac(int n) {
  if (n==0)
    return 1;
  else return n*fac(n-1);
}
int main(int argc, char* arv[]) {
  long long y = fac(atoi(argv[1]));
  printf("res: %lld\n",y);
  return 0;
}
```

- Had to use a long long
- Pretty ugly

```python
def fac(n):
  if n==0:
    return 1
  else:
    return n * fac(n-1)

print("one: ", fac(50))
```

- Almost as short as Haskell
- Will not overflow

```hs
fac :: Integer -> Integer
fac 0 = 1
fac n = n * fac (n - 1)
```

- What is the shorter!?
  - Haskell!!!!

## Performance check

| Python | C | Haskell |
| --------------- | --------------- | --------------- |
|system 99% cpu 2:39.54 total | system 3% cpu 0.077 total | system 92% cpu 2.045 total |
| Correct Answer | Wrong Answer | Correct Answer |

### Fun Suegue

- What if Haskell uses the same 64-bit representation?

```hs
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n - 1)

again :: Int -> Int -> Int
again 0 acc = acc
again n acc = again (n - 1) (acc + fac 20)
```

Haskell ends up being <1 second. About 0.850s

#### Bottom Line

- Python is correct but slow
C is very fast, but requires special handeling

## Fibonnaci

Recall:
Fibonacci is just the last two members of a list added to each other

```hs
fib :: (Eq a, Num a) => a -> a
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

- this makes loops feel clunky. Who needs?

```c
for (int i == 0, i < n; i++)
```

- The code writes itself!

## Fibonacci V2

- There are Guards!

```hs
fib :: (Ord a, Num a) => a -> a
fib n | n < 2       = n
      | otherwise   = fib (n - 1) + fib (n - 2)
```

- Guards are boolean predicates to select the clause base on conditions
- They are always true
- Notice the Ordinal compared to Equality. The first one checked for equality. This with guards checks for order.

## Another function

Compute sum of integers from 0..n

```hs
sumn :: (Eq a, Num a) => a -> a
sumn 0 = 0
sumn n = n + (sumn $ n - 1)
```

## Multiplication

- consider the definition of multiplication as repeated addition:

$$
a \cdot b = b + \dots + b
$$

- Ask the minion to add up as many as you need
- There are two base cases in this

```hs
mult 0 _ = 0
mult _ 0 = 0
mult a b
  | a < b     = b + mult (a - 1) b
  | otherwise = a + mult a (b - 1)
```

- This is slow because of the number of recursive calls is proportional to the size of the input. This is dumb

## Faster Multiplication

- Discrete Math!
- Divide and Conquer!

```hs
fmult 0 _ = 0
fmult _ 0 = 0 -- Same base cases
fmult a b | even a     = 2 * fmult (a `div` 2) b
          | otherwise  = b + 2 * fmult ((a - 1) `div` 2) b
```

- Guards are pretty neat.
- When even.. half each time and double to compensate
- When odd, strip one and then back to even case

## Square Roots

- Imagine `sqrt` is broken
- assume that x > 1
  - then sqrt(x) belongs to 1..x
  - use squaring of the MIDPOINT to choose which side!
- By squaring the midpoint and comparing, this allows you to say where the square root is in relation to the midpoint

```haskell
square x = x^2
mysqrt_converge x a b = if abs(a - b) < 0.0001
                        then a
                        else if (square $ (a + b)/ 2) > x
                             then mysqrt_converge x a ((a+b)/2)
                             else mysqrt_converge x ((a+b)/2) b

mysqrt x = mysqrt_converge x 1 x

mysqrt 10
```

- The code is very ugly
- Repeated calculations
- Polution of the namespace with helper functions

## Square Root Improved

```hs
mysqrt x = let mysqrt_converge x a b = let avg = (a + b)/2
                        in if abs(a - b) < 0.0001
                           then a
                           else if avg^2 > x
                                then mysqrt_converge x a avg
                                else mysqrt_converge x avg b
                in mysqrt_converge x 1 x
mysqrt 10
```

```hs
mysqrt x = let aux x a b | abs(a-b) < 0.001 = a
                         | avg^2 > x        = aux x a avg
                         | otherwise        = aus x avg b
               where avg = ( a + b)/ 2
           in aux x 1 x

mysqrt 10
```

## Lexical Scope

```hs
f x = let g y = x + y
      in let x = 5  -- What `x` is this?
          in g 11   -- g is being given the name `y`
f 6                 -- lexical scoping
```

## Going back to `mysqrt`

```hs
mysqrt x = let aux a b | abs(a - b) < 0.0001   = a -- x is not used here
                         | avg^2 > x           = aux a avg --
                         | otherwise           = aux avg b
                where avg = (a + b) / 2
            in aux 1 x
```

- We can completely get rid of the usage of `x` in the aux function since it is passed in to `mysqrt`

## Going down the Prime Hole

- Number **n** is composite if it has a divisor other than 1 and n (or it is prime!)
  - To test primality, find out if n has a divisor 1 < d < n
  - A number n is k-smooth if it has a divisor 1 < d <= k
  - Therefore n is a composite if it is (n - 1)-smooth

```hs
smooth n k | k < 2                  = False
           | n 'mod' k == 0         = True
           | otherwise              = smooth n (k - 1)

composite n = smooth n (n - 1)
prime n = not (composite n)
```

Given an integer $n \lt 1$, to test whether $n$ is prime check
to see if it is divisible by a prime number less than or
equal to its square root. If it is not divisible by any of
these numbers, then it is prime.

- Divisors come in pars
  - When 1 <d < n is a divisor of n
  - then d * m = n
  - thus $d \lt \frac{m}{n} \lt d$

```hs
smooth n k | k < 2                   = False
           | n `mod` k == 0          = True
           | otherwise               = smooth n (k - 1)
composite n = smooth n (floor (sqrt (fromIntegral n)))
prime n = not (composite n)

> :t (.)
(.) :: (b -> a) -> (a -> b) -> a -> c
```

- Knowing that the `(.)` operator is the composition function, we can clean it up more

```hs
composite n = (smooth n) . floor . sqrt . fromIntegral $ n
prime n = not (composite n)
```

- Composition is just an operator whose inputs are functions

### Optimize more

- Hide the auxilliary smooth function in prime
- Get rid of composite:

```hs
smooth n k | k < 2                    = False
           | n `mod` k == 0           = True
           | otherwise                = smooth n (k - 1)

composite n = (smooth n) . floor . sqrt . fromIntegral $ n -- Style to use `$` at the end instead of ()
prime n = not (composite n)

```

```hs
prime n = not . (smooth n) . floor . sqrt . fromIntegral $ n
  where smooth n k | k < 2              = False
                   | n `mod` k == 0     = True
                   | otherwise          = smooth n (k - 1)
```

- Look at `n` since it is included in the initial `prime n`, we can get rid of n

```hs
prime n = not . smooth . floor . sqrt . fromIntegral $ n
  where smooth   k | k < 2              = False
                   | n `mod` k == 0     = True
                   | otherwise          = smooth $ (k - 1)
```

## Harmonic Series

```hs
harmonic :: (Integral a, Floating b) => a -> b
harmonic 0 = 0 
harmonic n = 1 / n + (harmonic $ n - 1)
```

- In Haskell Functions are values

  - you can take a function as input to another function
  - You can produce a function as output of another function.
  - Classic Exampe

$$
\sum_{i=0}^{n} f(i)
$$

```hs
sumf :: (Eq t, Num t, Num a) => (t -> a) -> t -> a
sumf f 0 = f 0
sumf f n = f n + (sumf f (n - 1))
```

- Now we can use `sumf` to do functions like

```hs
> sumf (^2) 5
55
> sumf (^3) 5
225
> sumf (\x -> x^2 - 3 * x + 2) 5
22
```

### Power Series?

- Now realize that with `sumf` defined, we can calculate things like `sin(x)`
  quite easily
  - Recall:
  $$
  C_i = (-1)^{\frac{i -1}{2}} \cdot \frac{1}{i!} -> \text{i is odd}
  $$

  ```hs
  pseries :: (Integral a, Fractional b) => (a -> b) -> a -> b -> b
  pseries f k x | k < 0 = 0
                | otherwise f k * x^k + pseries f (k-1) x
  ```

## Computing Integrals

- Recall it is rectangles
  - More recatangles, more precision
- The width of a rectangle is $\frac{b-a}{n}$
- The sample (midpoint) of a rectangle k is : $a + width \cdot k + \frac{width}{2}$
- Just evaluate the area of rectangle $k$ at the sampled midpoint,
  then sum up (with `sumf`)

```hs
sumf :: (Eq t, Num t, Num a) => (t -> a) -> t -> a
sumf f 0 = f 0
sumf f n = f n + (sumf f (n - 1))

integrate :: (Integral a, Fractional t) => (t -> t) -> t -> t -> a -> t
integrate foo a b n = sumf area n
  where width = (b - a) / fromIntegral n
        sample k = foo (a + width * fromIntegral k + width/2)
        area k = width * sample k
```

- Notice `integrate` is *not* recursive, but `sumf` is recursive
- We aren't writing loops (python)
- We aren't using recursion, we are using the `sumf` recursive call

## Recursion Segue

- Recall that in Python, recursion is quite dumb, it overflows and long runtimes

```python
def sumi(n):
  if n==0:
    return 0
  else:
    return n + sumi(n-1)

print("sum",sumi(500_000_000))
```

- Python will fail!

```hs
sumi :: Int -> Int
sumi 0 = 0
sumi n = n + sumi (n - 1)

main = do
  print $ show $ sumi 10000000
```

```c
#include <stdio.h>
#include <stdlib.h>

long long sumi(long long n) {
  if (n==0)
    return 0;
  else return n + sumi(n-1);
}

int main() {
  long long a = sumi(50'000'000);
  printf("Sum is: %lld\n", a);
  return 0;
}
```

- c is faster, but only with optimization turned on

- Haskell does not suffer from a stack overflow, but takes longer
  - This is because of Thunks!
    - `Thunk` is a value that is yet to be evaluated.
    Implemented in Haskell systems which use *non-strict semantics* by *lazy evaluation*
  - Haskell amasses thunks to compute additions, but never evaluates them
  - This makes it take time to allocate memory, init the thunk and then later evaluate

```hs
sumi :: Int -> Int
sumi 0 = 0
sumi n = n + sumi (n-1)

sum2 :: Int -> Int -> Int
sum2 0 acc = acc
sum2 n acc = sum2 (n-1) (acc+n)

main do
  print (sum2 1000000000 0)
```

- The trick is to force the evaluation through the use of a bang pattern

### Bang Patterns

- There is a way to tell Haskell to not evaluate lazy style
- this is called the Bang (!)
- Add ! in front of an argument to force the eval and not leave the operation for last

```hs
sumi :: Int -> Int
sumi 0 = 0
sumi n = n + sumi (n-1)

sum2 :: Int -> Int -> Int
sum2 0 !acc = acc
sum2 n !acc = sum2 (n-1) (acc+n)

main do
  print (sum2 1000000000 0)
```

#### Fibbonacci

- F_n = 0 if n=0, 1 if n=1, f_(n-1) + f_(n-2)

```hs
Fibbonacci :: (Num a, Eq a) => a -> a
Fibbonacci 0 = 0
Fibbonacci 1 = 1
Fibbonacci n = Fibbonacci (n-1) + Fibbonacci (n-2)
```

```hs
fibv2 :: (Ord a, Eq a) => a -> a
fibv2 n | n < 2   = n
        | otherwise = fibv2 (n-1) + fibv2 (n-2)
```
