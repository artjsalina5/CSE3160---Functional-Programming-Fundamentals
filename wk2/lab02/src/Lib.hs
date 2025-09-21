module Lib (
  checkPrime,
  isPrime,
  or',
  xor',
  nand',
  triangleNumbers,
  pow,
  choose,
) where

-- Implement your versions below.
-- Feel free to add auxiliary functions as needed-
checkPrime :: (Integral t) => t -> t -> Bool

{- | Given a number n and a target t and returns True
if none of the numbers between 2 divide n.
-}
checkPrime n t
  | t < 2 = True
  | n `mod` t == 0 = False
  | otherwise = checkPrime n (t - 1)

isPrime :: (Integral a) => a -> Bool

-- | Given a number n, check every number from 2 to n/2
isPrime n
  | n < 2 = False
  | otherwise = checkPrime n (floor . sqrt $ fromIntegral n)

or' :: Bool -> Bool -> Bool
or' False False = False
or' _ _ = True

xor' :: Bool -> Bool -> Bool
xor' True False = True
xor' False True = True
xor' _ _ = False

nand' :: Bool -> Bool -> Bool
nand' True True = False
nand' _ _ = True

triangleNumbers :: (Ord a, Num a) => a -> a
triangleNumbers 0 = 0
triangleNumbers 1 = 1
triangleNumbers n = n + triangleNumbers (n - 1)

pow :: (Integral a) => a -> a -> a
{- If b is 0, the result is 1.
Recursive Step: If b is greater than 0, the result is a multiplied by the result of a^(b-1). -}
pow _ 0 = 1
pow a b = a ^ (b - 1)

choose :: (Integral a) => a -> a -> a
{- Given an n and k implements the n Choose k algorithm -}
choose n k
  | n < 0 || k < 0 = 0
  | k > n = 0
  | k == 0 || k == n = 1
  | otherwise = choose (n - 1) (k - 1) + choose (n - 1) k
