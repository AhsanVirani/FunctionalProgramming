module Map where
-- recursive function
map' :: (a -> b) -> [a] -> [b]
map' mapper [] = []
map' mapper (x:xs) = mapper x : map' mapper xs

-- Tail recursive
map'' :: (a -> b) -> [a] -> [b]
map'' mapper xs = map1 xs []
    where
        map1 [] rs     = reverse rs 
        map1 (x:xs) rs = map1 xs (mapper x : rs)