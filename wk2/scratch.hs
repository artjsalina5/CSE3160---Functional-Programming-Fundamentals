module Scratch (
  fib,
  foo,
  square,
  mysqrt,
  mySquareRoot,
  mySqrtTight,
  sumSQ,
  sumEVEN,
  hProd,
  divides,
  divisorsUpto,
  divisors,
) where

fib :: (Eq a, Num a) => a -> a
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibv2 :: (Ord a, Num a) => a -> a
fibv2 n
  | n < 2 = n
  | otherwise = fibv2 (n - 1) + fibv2 (n - 2)

foo :: (Ord a, Num a) => a -> a -> Char
foo x y
  | x <= y = 'A'
  | x == y = 'B'
  | x == 7 * y = 'C'

square :: (Num a) => a -> a
square x = x ^ 2

mysqrtConverge x a b
  | abs (a - b) < 0.0001 = a
  | square ((a + b) / 2) > x = mysqrtConverge x a ((a + b) / 2)
  | otherwise = mysqrtConverge x ((a + b) / 2) b

mysqrt x = mysqrtConverge x 1 x

mySqrtConverge x a b =
  let avg = (a + b) / 2
   in if abs (a - b) < 0.0001
        then a
        else
          if avg ^ 2 > x
            then mySqrtConverge x a avg
            else mySqrtConverge x avg b

mySquareRoot x = mySqrtConverge x 1 x

mySqrtTight x =
  let aux x a b
        | abs (a - b) < 0.0001 = a
        | avg ^ 2 > x = aux x a avg
        | otherwise = aux x avg b
       where
        avg = (a + b) / 2
   in aux x 1 x

{- | Computes the sum of the first n squares:

\[
  \sum_{i=0}^{n} i^2
\]
-}
sumSQ :: (Eq t, Num t) => t -> t
sumSQ 0 = 0
sumSQ n = n * n + sumSQ (n - 1)

{- | Adapt the function so that it computes the sum of the first n
 even numbers.
-}
sumEVEN :: (Eq t, Num t) => t -> t
sumEVEN 0 = 0
sumEVEN n = 2 * n + sumEVEN (n - 1)

hProd :: (Fractional a, Integral t) => t -> a
hProd 0 = 0.0
hProd 1 = 1.0
hProd n = (1 - (1 / fromIntegral n)) * hProd (n - 1)

-- | Determines if a given whole number, b, divides another number a
divides :: (Integral a) => a -> a -> Bool
divides a b = b `mod` a == 0

-- | Calculates the number of divisors n has between 1 and k
divisorsUpto :: (Integral t, Num a) => t -> t -> a
divisorsUpto _ 1 = 1
divisorsUpto n k
  | divides k n = 1 + divisorsUpto n (k - 1)
  | otherwise = divisorsUpto n (k - 1)

-- | Given a number n, compute number of divisors
divisors :: (Integral t, Num a) => t -> a
divisors n = divisorsUpto n n
