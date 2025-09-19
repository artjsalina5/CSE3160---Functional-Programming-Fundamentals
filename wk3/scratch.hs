import Data.Char

foldr' _ acc [] = acc
foldr' f acc (x : xs) = f x (foldr' f acc xs)

firstFivePal :: (Eq a) => [a] -> Bool
firstFivePal s =
  let f5 = take 5 s
   in reverse f5 == f5

{- | Takes a string as an argument and returns number, n, of lowerCase elements in list
nbLower :: String -> Integer
-}
nbLower :: [Char] -> Int
nbLower s = length $ filter isLower s

flip f x y = f y x

bitsToIntL :: (Num a) => [a] -> a
bitsToIntL = foldl (\acc b -> acc * 2 + b) 0

{- with a fold right the accumulator needs to be 0->1->2->3
 - we add 1 to the accumulator
 - -}
bitsToIntR :: (Num a) => [a] -> a
bitsToIntR = foldr (\b acc -> b + 2 * acc) 0
