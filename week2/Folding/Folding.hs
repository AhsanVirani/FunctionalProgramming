-- Sumr and Suml
sumr :: Num a => [a] -> a
sumr xs = foldr (+) 0 xs

suml :: Num a => [a] -> a
suml xs = foldl (+) 0 xs

-- Productr and Productl
productr :: Num a => [a] -> a
productr xs = foldl (*) 1 xs

productl :: Num a => [a] -> a
productl xs = foldr (*) 1 xs

-- Mapr and Mapl
mapr :: (a -> b) -> [a] -> [b]
mapr f xs = foldr (\x result -> f x : result) [] xs

mapl :: (a -> b) -> [a] -> [b]
mapl f xs = foldl (\result x -> f x : result) [] xs

filterr :: (a -> Bool) -> [a] -> [a]
filterr f xs = foldr filtered [] xs
    where 
        filtered x result
            | f x       = x : result 
            | otherwise = result

filterl :: (a -> Bool) -> [a] -> [a]
filterl f xs = foldl filtered [] xs
    where 
        filtered result x
            | f x       = x : reverse result 
            | otherwise = reverse result

-- Test 
main :: IO ()
main = do
let input = [1..10]

putStrLn "Calculating sum of [1..10]"
putStrLn " Using foldr"
putStrLn (show $ sumr input)
putStrLn " Using foldl"
putStrLn (show $ suml input)

-- Product
putStrLn "Calculating Product of [1..10]"
putStrLn " Using foldr"
putStrLn (show $ productr input)
putStrLn " Using foldl"
putStrLn (show $ productl input)

-- Filter
putStrLn "Filtering odd elements [1..10] using filter"
putStrLn " Using foldr"
putStrLn (show $ filterr odd input)
putStrLn " Using foldl"
putStrLn (show $ filterl odd input)
