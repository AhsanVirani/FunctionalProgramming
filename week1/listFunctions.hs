import Data.Char (toLower)
import Data.Bool (Bool)

-- Creating custom map function
-- Base case when list is empty
-- When list is non empty

myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

-- sum
mySum :: [Int] -> Int 
mySum []     = 0
mySum (x:xs) = x + mySum xs

myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x:xs) = x ++ myConcat xs

-- abstract away recursion
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f z [] = z
myFoldr f z (x:xs) = x `f` (myFoldr f z xs) 

mySum' = myFoldr (+) 0
myConcat' = myFoldr (++) []

-- filter
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p [] = []
myFilter p (x:xs) = if p x then x : myFilter p xs else myFilter p xs

myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' p [] = []
myFilter' p (x:xs) 
    | p x = x : myFilter' p xs 
    | otherwise = myFilter' p xs