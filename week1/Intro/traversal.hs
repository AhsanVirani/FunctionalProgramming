myMap :: [Integer]
myMap = map (+ 10) [1, 2, 3]


myMapN :: Num b => b -> [b]
myMapN n = map (+n) [1,2,3]
