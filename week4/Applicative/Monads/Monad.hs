module Monad where

import Prelude hiding(Maybe(..))

-- Defining custom Maybe type
data Maybe a = Nothing 
            | Just a
            deriving Show

-- Defining Functor for our Maybe type
instance Functor Maybe where
    fmap f Nothing  = Nothing
    fmap f (Just x) = f <$> (Just x)

-- Define Applicative for our Maybe type
instance Applicative Maybe where
    
    pure x = Just x
    
    (<*>) Nothing _ = Nothing 
    (<*>) _ Nothing = Nothing
    (<*>) (Just f) (Just x) = (Just f) <*> (Just x)

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

