module Main (main) where

import Lib

main :: IO ()
main = do putStrLn "Lab 01"
          print $ circleArea (10.0::Double)

