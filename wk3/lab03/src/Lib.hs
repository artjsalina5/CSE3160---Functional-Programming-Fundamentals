module Lib (
  fac,
  dupPairs,
  sumEvens,
  squaresUnder,
  nbSpecial,
  sumPolyOuts,
  adjDiff,
) where

-- Implement your versions below.
-- These are all one-line functions using only lists, list functions,
-- and lambdas as needed in the function bodies.

fac :: (Integral n) => n -> n
fac k = product [1 .. k]

dupPairs :: [b] -> [(b, b)]
dupPairs l = zip l l

sumEvens :: (Num a, Enum a) => a -> a
sumEvens n = sum [0, 2 .. n]

-- | Takes a positive integer k as a argument and returns a list of squares that are less than k.
squaresUnder :: (Num a, Ord a, Enum a) => a -> [a]
squaresUnder n = filter (< n) (map (^ 2) [1 .. n])

nbSpecial :: (Ord a, Num a, Enum a) => [a] -> Int
nbSpecial xs = length (filter (\(i, x) -> x >= 7 * i) (zip [0 ..] xs))

sumPolyOuts :: (Num a) => (Int -> a) -> Int -> a
sumPolyOuts f k = sum (map f [1 .. k])

adjDiff :: (Ord a, Num a) => a -> [a] -> Int
adjDiff k l = length (filter (\(a, b) -> abs (a - b) > k) (zip l (tail l)))
