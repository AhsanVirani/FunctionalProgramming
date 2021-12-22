module Filter where

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (x:xs)
    | f x       = x : filter' f xs 
    | otherwise = filter' f xs

-- Tail recursive
filter'' :: (a -> Bool) -> [a] -> [a]
filter'' f xs = filter1 xs []
    where
        filter1 [] rs     = reverse rs
        filter1 (x:xs) rs 
            | f x       = filter1 xs (x : rs) 
            | otherwise = filter1 xs rs