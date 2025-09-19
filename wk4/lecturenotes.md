# Notes Wk4

## Going back to repeating

- We can `take` things from the front of the list

```hs
take' 0 l = []
take' n (h:t) = h : take(n-1) t
```

## Calculating things

- Prefix Sum

### Higher Order

- All the classics still available
  - `map`
  - filter

## Question

```hs
foldl (||) False (repeat True)
foldr (||) False (repeat True)
```

### Natural Numbers

```hs
nats = : zipWith (+) nats (repeat 1)
take 10 nats

```

## List Comprehension

```hs
> [x^2 | x <- [1..42]]
```

This is equivalent to:

```hs
map (^2) [1..42]
```

```hs
[7*x | x <- [1..100], x `mod` 3 == 0]
```

### Example

```hs
[if even x then x else -x | x <- [1..20], x `mod` 3 == 0]
```

## Multiplication Tables (again)

```hs
table n = [k*n | k <- [1..]]
```

### Examples

- Sum of squares

```hs
sumSquare :: (Num a) => Int -> [a] -> a
sumSquare k l = sum  (take k [x^2 | x <- l])

main = do print $ sumSquare 100 [1,2..]
```

- Computing a standard deviation (and mean)

```hs
mean l = (sum l) / (fromIntegral . length $ l)
stdev l = let mu = mean l
              mu2 = mean [x^2 | x <- 1]
           in sqrt (mu2 - mu^2)
```

- Filtering a list to eliminate members of a list *l* divisible by some target *h*

```hs
sift h l = [v | v <- l, v `mod` h == 0]
```

- The subset of values that are not divisible by *h*

```hs
take 10 $ sift 2 [3,4..]
```

- This goes and checks that whatever the value of the list is checking is NOT divisible by 2.
- this will output:

```hs
[3,5,7,9,11,13,15,17,19,21]
```

- Why do we love `2` and `3`?
  - They are Primes!

- So we ended up eliminating all the things that were a multiple of a prime
  - To come up with an algorithm to sift and get the primes in a list,
    change the mod *h* to the head

```hs
sifted = sift 2 [3,4..]
k = head sifted
t = tail sifted
take 10 $ k
```

```hs
sieve (h:t) = h : sieve [v | v <- t, v `mod` h /= 0]
primes = sieve [2,3..]
take 20 primes
```

### Cartesian Product with a filter

```hs
import Data.Char
cp1 a b = [(x,y) | x <- a, y <- b]
cp2 a b p [(x,y) | x <- a, y <- b, p x y]
```

### Parallel Combination

We need the compiler directive for Parallel List Comprehension

```hs
{-# LANGUAGE ParallelListComp #-}
mulsc l1 l2 = [a*b | a <- l1 | b <- l2]
```

### Removing Punctuation

```hs
import Data.Char
remp l = [c | c <- l, not (isPunctuation c)]
remp l = [c | c <- l, not (Data.Char.isPunctuation c)]
remp l = [c | c <- l , not . isPunctuation $ c]
```

- All three of these do this

### Convert a String to Upper Case if Lower Case

```hs
import Data.Char
remap l = [toUpper c | c <- l]
```

### Funny Length

- How do we compute the length of a list using comprehension?

```hs
length' :: (Num a) => [t] -> a
length' l = sum [1 | _ <- l]
```

### Silly Prompt

- Generate 20 Pythagorean triangles
  - Where the length are integral and satisfy $a^2 + b^2 = c^2$
  - Use a comprehension

```hs
genPyth n = [n | a <- [1,..], b <- [1,..], c <- [1,..], a^2 + b^2 == c^2 ]
```

### Exercise

- Find all solutions where

$$
x, y \in\quad \{-1000,-999,\cdots,999,1000\}
$$
to the equation $1027x + 712y = 1$

```hs
solnEq = [ (x,y) | x <- [-1000..1000], y <- [-1000..1000], 1027*x + 712*y == 1 ]
```
