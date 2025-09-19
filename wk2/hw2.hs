module Lib (
  sumSQ,
  sumEVEN,
  hProd,
  divisors,
  appxpi,
  goldenAppx,
  goldenRootAppx,
  twor,
  randomGen,
  perrin,
  perrinFast,
  alternatingFac,
) where

sumf :: (Eq t, Num t, Num a) => (t -> a) -> t -> a
sumf _ 0 = 0
sumf f n = f n + sumf f (n - 1)

prodf :: (Eq t, Num t, Num a) => (t -> a) -> t -> a
prodf _ 0 = 0
prodf f n = f n * prodf f (n - 1)

sumSQ :: (Eq t, Num t) => t -> t
sumSQ 0 = 0
sumSQ n = sumf (\x -> x * x) n

isEven :: (Eq t, Num t) => t -> Bool
isEven 0 = True
isEven 1 = False
isEven n = isEven (n - 2)

sumEVEN :: (Eq t, Num t) => t -> t
sumEVEN = sumf (\x -> if isEven x then x else 0)

hProd :: (Fractional a, Integral t) => t -> a

{- | Given a value k, computes arithmetic sequence product of (1 - 1/k)
\[
\prod_{i=0}^{n}
\]
-}
hProd k
  | k <= 1 = 1
  | otherwise = (1 - 1 / fromIntegral k) * hProd (k - 1)

divides :: (Integral a) => a -> a -> Bool

{- | Given a value `a`, checks to see if it is divisble by b:
\[
a = bq + r | r = 0
\]
-}
divides a b = b `mod` a == 0

{- Minion tells how many divisors from previous iteration -}
divisorsUpto :: (Integral t, Num a) => t -> t -> a
divisorsUpto _ 1 = 1
divisorsUpto n k
  | divides k n = 1 + divisorsUpto n (k - 1)
  | otherwise = divisorsUpto n (k - 1)

divisors :: (Integral t, Num a) => t -> a
divisors n = divisorsUpto n n

alternateOne :: (Integral a, Floating b) => a -> b
alternateOne k = (-1) ** fromIntegral k

appxpi :: (Integral a, Floating b) => a -> b

{- | Given a value n, compute the approximation to pi
using the Leibniz series
\[
(-1)^k * 1/(2k + 1)
\]
-}
appxpi 0 = 0
appxpi n = appxpi (n - 1) + 4 * (alternateOne (n - 1) / fromIntegral (2 * (n - 1) + 1))

goldenAppx :: (Eq a, Num a, Floating b) => a -> b

{- | Given a parameter, n, computes the nth convergent of the golden ratio continued fraction
\[
\phi = 1 + \frac{1}{\phi}
\]
-}
goldenAppx 0 = 1
goldenAppx n = 1 + 1 / goldenAppx (n - 1)

goldenRootAppx :: (Eq a, Num a, Floating b) => a -> b

{- | Given a parameter, n, computes the nth convergant of the golden ratio unfolding square root
\[
\phi = \sqrt{1 + \sqrt{1 + \sqrt{1 + \cdots}}}
\]
-}
goldenRootAppx 0 = 1
goldenRootAppx n = sqrt (1 + goldenRootAppx (n - 1))

twor :: Bool -> Bool -> Bool -> Bool

-- | Utilizes pattern matching for a simple three fold and operation
twor True True _ = True
twor _ True True = True
twor True _ True = True
twor _ _ _ = False

randomGen :: (Integral a) => a -> a -> a -> a -> a

-- | By defining an aux function, this can create a hash key of an algorithm
randomGen mult m seed = aux
 where
  aux 0 = seed
  aux i = (mult * aux (i - 1) + 1) `mod` m

perrin :: (Eq a, Num a) => a -> a
-- naive version
perrin 0 = 3
perrin 1 = 0
perrin 2 = 2
perrin n = perrin (n - 2) + perrin (n - 3)

-- insist on linear (fast) runtime
perrinFast :: (Eq a, Num a) => a -> a

{- | Given a number, n, computer the Perrin number. This function utilizes windowing to
 - accomplish o(n) runntime linearly.
-}
perrinFast 0 = 3
perrinFast 1 = 0
perrinFast 2 = 2
perrinFast n = aux 3 0 2 2
 where
  aux a b c k
    | k == n = c
    | otherwise = aux b c (a + b) (k + 1)

fac :: (Eq a, Num a) => a -> a
fac 0 = 1
fac a = a * fac (a - 1)

-- Check the formula (collapsing sums)
alternatingFac :: (Eq a, Num a) => a -> a
alternatingFac 1 = 1
alternatingFac a = fac a - alternatingFac (a - 1)
