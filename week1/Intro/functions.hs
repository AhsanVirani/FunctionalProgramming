twice :: (a -> a) -> (a -> a)
twice f a = f(f a)

double :: Int -> Int 
double x = x * 2

quadruple :: Int -> Int 
quadruple = twice double
