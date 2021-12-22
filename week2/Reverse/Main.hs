module Main where

import Reverse

main :: IO ()
main = do
    putStrLn $ "Reverse of " ++ (show inp) ++ " is " ++ (show rs)
    where 
        inp = [1..10]
        rs = Reverse.reverse inp