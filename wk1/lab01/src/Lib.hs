module Lib (
    someFunc,
    circleArea,
    sphereArea,
    ballVolume,
    countAncestors,
) where

someFunc :: IO ()
someFunc = putStrLn "Hello Haskell world!"

-- Implement your version below. Feel free to add auxiliary functions
-- as needed
circleArea :: (Floating p) => p -> p
circleArea r = pi * (r ** 2)

-- Implement your version below. Feel free to add auxiliary functions
-- as needed
sphereArea :: (Floating p) => p -> p
sphereArea r = 4 * pi * (r ** 2)

-- Implement your version below. Feel free to add auxiliary functions
-- as needed
ballVolume :: (Floating p) => p -> p
ballVolume r = (4 * pi * (r ** 3)) / 3

-- Implement your version below. Feel free to add auxiliary functions
-- as needed
countAncestors :: (Integral p) => p -> p
countAncestors n =
    if n == 0
        then 1
        else 2 * countAncestors (n - 1)
