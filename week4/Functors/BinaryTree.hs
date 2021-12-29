module BinaryTree where

import Data.Functor
import GHCi.Message (EvalOpts(singleStep))

-- Tree
data Tree a = Leaf 
            | Node (Tree a) a (Tree a)
            deriving (Show, Eq)

-- Create a tree
node :: Tree a -> a -> Tree a -> Tree a
node l x r = Node l x r

-- Induct a value into a new tree
singleton :: a -> Tree a
singleton x = Node Leaf x Leaf

-- Defining instance of functor
instance Functor Tree where
    fmap _ Leaf = Leaf -- empty tree
    fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

-- Testing
sampleTree :: Tree Int 
sampleTree = Node l 1 r 
    where
        l   = Node ll 2 rr
        r   = Node lr 3 rr
        ll  = Node lll 4 rll
        rl  = Node lrl 5 rrl 
        lr  = Node llr 6 rlr 
        rr  = Node lrr 7 rrr 
        lll = singleton 8
        rll = singleton 9  
        lrl = singleton 10
        rrl = singleton 11
        llr = singleton 12
        rlr = singleton 13
        lrr = singleton 14
        rrr = singleton 15

main :: IO ()
main = do
    let intTree = sampleTree
        -- convert tree of int to tree of strings 
        stringTree = fmap show intTree
        intTree1   = fmap (read :: String -> Int) stringTree
    putStrLn "Original Tree"
    print intTree
    putStrLn "Tree of integers to Tree of Strings"
    print stringTree

    putStrLn "Tree of Strings back to Tree on Int"
    print intTree1

    putStrLn "Checking for equality"
    print $ intTree == intTree1
