
module Main where
import Prelude (odd, IO, putStrLn, Show (show), ($))

import Filter 

main :: IO ()
main = do
    let 
        input = [1..10]
        odds  = filter' odd input
        odds' = filter'' odd input
    putStrLn "Filtering odd numbers in [1..10]"
    putStrLn "Using filter"
    putStrLn $ show $ odds
    putStrLn "Using tail recursive filter"
    putStrLn $ show $ odds'
