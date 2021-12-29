module Functor where

import Data.Functor ( (<$>) )
import Prelude 
import Distribution.Simple.Utils (xargs)

-- Square of a number
square :: Num a => a -> a
square x = x * x

-- Functor needs fmap, where
    -- fmap :: (a -> b) -> f a -> f b
    -- fmap is shorthanded <$>

squareList :: Num a => [a] -> [a]
squareList xs = square <$> xs

-- Mapping a Maybe
squareMaybe :: Num a => Maybe a -> Maybe a 
squareMaybe x = square <$> x

-- Mapping an Either
squareEither :: Num a => Either c a -> Either c a 
squareEither x = square <$> x

-- Define a data type
data Function a b = Function (a -> b)

instance Functor (Function a) where
    f `fmap` (Function g) = Function (f . g)

double :: Num a => a -> a
double x = x + x

main :: IO ()
main = do 
    putStrLn "Mapping a List"
    putStrLn $ show $ squareList [1..10]

    putStrLn ""
    putStrLn "Nothing -> Nothing"
    putStrLn $ show $ squareMaybe Nothing

    putStrLn ""
    putStrLn "Mapping Either"
    putStrLn "Right 10 -> Right 100"
    putStrLn $ show $ squareEither (Right 10 :: Either String Int)
    putStrLn "Left String -> Left String"
    putStrLn $ show $ squareEither (Left "Error" :: Either String Int)
    
    let squareF = Function square
        doubleSquare = double <$> squareF

    -- Take the resultant function out of doubleSquare
    let Function dsq = doubleSquare
    putStrLn "Double the Square of X"
    print $ dsq 10