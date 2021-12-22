module Main where
import Map 


main :: IO ()
main = do
    putStrLn $ show $ map'' (\x -> x + 1) [2, 3, 4, 5, 6]