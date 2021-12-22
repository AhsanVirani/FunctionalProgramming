module Main where

import Fib_infinite

main :: IO ()
main = do
    let
        fib10k = fib 10000
    putStrLn $ "10000th fibonacci number is: " ++ show fib10k