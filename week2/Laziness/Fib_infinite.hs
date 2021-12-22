module Fib_infinite where

fib :: Int -> Integer
fib n = fiblist !! n

-- Definition of fiblist
fiblist :: [Integer]
fiblist = 0 : 1 : zipWith (+) (fiblist) (tail fiblist)
