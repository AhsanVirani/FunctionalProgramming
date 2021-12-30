module BinaryTree where

import Data.Functor 
import Control.Applicative
import System.Directory.Internal.Prelude (Applicative)

data Tree a = Leaf 
            | Node (Tree a) a (Tree a)
            deriving (Show, Eq)

instance Functor Tree where 
    fmap _ Leaf         = Leaf
    fmap f (Node l v r) = Node (fmap f l) (f v) (fmap f r)

-- Applicative instance for Binary Tree
instance Applicative Tree where
    pure x = let t = Node t x t in t