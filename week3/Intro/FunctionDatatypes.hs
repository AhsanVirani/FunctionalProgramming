import GHC.Show (Show)
import Distribution.Simple.Utils (xargs)
import Text.ParserCombinators.Parsec.Token (GenTokenParser(squares))
-- Define a function type
newtype Func a b = Func (a -> b)

-- Compose function takes in two functions Func and composes them together 
compose :: Func a b -> Func b c -> Func a c
compose (Func f) (Func g) = Func (g . f)

---- Apply function takes our data type Func and applies an arguement to it
apply :: Func a b -> a -> b
apply (Func f) a = f a

-- Fix takes a function as argument and recursively degines itself to the function
newtype Fix f = Fix (f (Fix f))

data Ghost a = Ghost deriving Show

-- main function to use above created stuff
main :: IO ()
main = do
    let square x = x * x
        sqrti    = floor . sqrt . fromIntegral 
    
    let squareF = Func square 
        sqrtF   = Func sqrti

    let idF = compose squareF sqrtF
    
    putStrLn "Composing square and square root functions"
    putStrLn "is an identity. Applying a value should not change it"
    print $ apply idF 3

    let x     = Ghost
        y     = Fix x
        Fix z = y
    
    putStrLn "Original value is "
    print x
    putStrLn "After Fixing, "
    print z