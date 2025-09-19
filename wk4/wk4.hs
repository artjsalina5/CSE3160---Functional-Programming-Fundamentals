
import Data.Char

repeat' :: a -> [a]
repeat' x = x : repeat x

cycle' :: [a] -> [a]
cycle' l = aux l
 where
  aux [] = aux l
  aux (h : t) = h : aux t

natFrom :: (Num t) => t -> [t]
natFrom n = n : natFrom (n + 1)

take' :: (Eq t, Num t) => t -> [a] -> [a]
take' 0 _ = []
take' n (h : t) = h : take' (n - 1) t

sumPrefix n (h : t) = foldr (+) n

table n = aux 0
 where
  aux k = n * k : aux (k + 1)

allTables :: (Num t) => Int -> [[t]]
allTables nb = aux 1
 where
  aux seed = take nb (table seed) : aux (seed + 1)

allTables' :: (Num t) => t -> [[t]]
allTables' s = aux s
 where
  aux seed = table seed : aux (seed + 1)

allTables'' :: (Num t) => (t -> a) -> t -> [a]
allTables'' g seed = g seed : allTables'' g (seed + 1)

take2 :: Int -> [[a]] -> [[a]]
take2 n l = aux n l
 where
  aux 0 l = []
  aux m (s2 : t) = (take n s2) : aux (m - 1) t

table' n l = map (* n) [1 .. l]

scanl' f acc l = acc : aux f acc l
 where
  aux f acc [] = []
  aux f acc (h : t) = let retVal = f acc h in retVal : aux f retVal t

-- Implement average prefix using higher order
sumPrefix' f = map (\x -> (x + 1) + x)

-- Implement takeWhile
takeWhile' _ [] = []
takeWhile' p (x : xs)
  | p x = x : takeWhile' p xs
  | otherwise = []

-- Collatz Conjecture

{- | Given an n, we create a sequence of numbers
\[
f(n) = n/2 `mod` 2 == 0
-}
collatzSequence 1 = [1]
collatzSequence n
  | even n = n : collatzSequence (n `div` 2)
  | otherwise = n : collatzSequence (3 * n + 1)

--- How do we get all the seuqences whose length is at least t?
allSeqs :: (Integral b) => Int -> [b]
allSeqs t = map head $ filter ((> t) . length) $ map collatzSequence [1 ..]

findCS :: (Integral a) => Int -> Int -> [a]
findCS m k = take m $ allSeqs k

sieve :: (Integral a) => [a] -> [a]
sieve (h : t) = h : sieve [v | v <- t, v `mod` h /= 0]


remap l = [toUpper c | c <- l]

genPyth  = [(a,b,c) | c <- [1..], b <- [1..], a <- [1..], a^2 + b^2 == c^2 ]

solnEq = [ (x,y) | x <- [-1000..1000], y <- [-1000..1000], 1027*x + 712*y == 1 ]
