module BinaryTree where
import Prelude 

-- Define a datatype of Tree
data Tree a = Leaf
            | Node (Tree a) a (Tree a)
            deriving (Show, Eq)

-- Make tree an instance of a functor
instance Functor Tree where
    fmap _ Leaf = Leaf
    fmap f (Node l x r) = Node (f <$> l) (f x) (f <$> r)

-- Make tree an instance of Applicative
instance Applicative Tree where
    pure x = Node (Leaf) (x) (Leaf)

    (<*>) Leaf _ = Leaf
    (<*>) _ Leaf = Leaf
    (<*>) (Node lf f rf) (Node l v r) = Node (lf <*> l) (f v) (lf <*> r)

-- Create 2 sample trees and add them
singleton :: a -> Tree a
singleton = pure

sampleTree :: Int -> Tree Int
sampleTree x = Node l x r 
    where
        l  = Node ll (x+1) lr
        r  = Node rl (x+2) rr
        ll = singleton (x+3)
        lr = singleton (x+4)
        rl = singleton (x+5)
        rr = singleton (x+6)

main :: IO ()
main = do
    let intTree1  = sampleTree 1
        intTree2  = sampleTree 5
    
    print $ intTree1
    print $ intTree2

    let finalTree = (+) <$> intTree1 <*> intTree2
    print $ finalTree