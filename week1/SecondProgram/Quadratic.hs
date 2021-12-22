module Quadratic where
    
import Prelude (Show, Double, (/), (*), (-), Floating (sqrt), (+), Bool (True, False))
import Data.Complex (Complex ((:+)))
import GHC.Base (error, (<), (==))

data Quadratic = Quadratic { 
                             a :: Double,
                             b :: Double,
                             c :: Double
                            } deriving Show

-- Typedef RootT
type RootT = Complex Double
data Roots = Roots RootT RootT deriving Show

roots :: Quadratic -> Roots
-- all constants are zero, error
roots (Quadratic 0 0 _) = error "Not a quadratic polynomial"
-- Is polynomial of degree 1, x = -c / b
roots (Quadratic 0.0 b c) = let root = ( (-c) / b :+ 0 ) 
                            in Roots root root

-- b^2 -4ac = 0
roots (Quadratic a b c) = 
    let discriminant = b * b - 4 * a * c
    in rootsInternal (Quadratic a b c) discriminant 

rootsInternal :: Quadratic -> Double -> Roots
-- Discrimiant is zero, roots are real
rootsInternal q d | d == 0 = 
    Roots root root
    where 
        r = (-(b q) / 2.0 / (a q))
        root = r :+ 0

rootsInternal q d | d < 0 = 
    Roots (realpart :+ complexpart) (realpart :+ (-complexpart))
    where 
        plusd = -d 
        twoa = 2.0 * (a q)
        complexpart = (sqrt plusd) / twoa
        realpart = - (b q) /twoa

-- discriminant is positive, all roots are real
rootsInternal q d = Roots (root1 :+ 0) (root2 :+ 0)
    where
        plusd = -d 
        twoa = 2.0 * (a q)
        dpart = (sqrt plusd) / twoa
        prefix = - (b q) / twoa 
        root1 = prefix + dpart 
        root2 = prefix - dpart 

