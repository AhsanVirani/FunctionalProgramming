module Monad where
import Data.Maybe (isJust)
import Prelude hiding(Maybe(..))
import Control.Monad 
import Distribution.Simple.Utils (xargs)

-- Defining custom Maybe type
data Maybe a = Nothing 
            | Just a
            deriving Show

-- Defining Functor for our Maybe type
instance Functor Maybe where
    fmap f Nothing  = Nothing
    fmap f (Just x) =  Just (f x)

-- Define Applicative for our Maybe type
instance Applicative Maybe where
    pure x = Just x
    (<*>) Nothing _ = Nothing 
    (<*>) _ Nothing = Nothing
    (<*>) (Just f) (Just x) = Just (f x) 

-- Defining Monad for our maybe type
instance Monad Maybe where
    return = Just

    Nothing  >>= _ = Nothing
    (Just x) >>= f = f x

add :: Num a => Maybe a -> Maybe a -> Maybe a 
add x y = do 
    i <- x -- m a (a -> m b) scrating a from Maybe a and making it maybe b. If fails, we return Nothing
    j <- y 
    return (i+j)

multiply :: Num a => Maybe a -> Maybe a -> Maybe a
multiply x y = liftM2 (*) x y

fromOdd :: Integral a => a -> Maybe a 
fromOdd x | odd x = Just x
fromOdd _         = Nothing 

main :: IO ()
main = do 
    print $ multiply (Just 10) (Just 2)
    print $ multiply (Just 10) Nothing 
    print $ add      (Just 10) (Just 2)
    print $ forM     [1..10]   (Just)
    print $ forM     [1..10]   (fromOdd)
    print $ (pure 10 :: Maybe Int) >>= \x -> return (x * x)