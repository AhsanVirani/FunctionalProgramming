import Data.Char (toLower)
-- Creating custom map function
-- Base case when list is empty
-- When list is non empty

myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs