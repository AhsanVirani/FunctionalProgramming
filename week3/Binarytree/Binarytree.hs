data BinaryTree a = Leaf
    | BinaryTree { left   :: BinaryTree a,
                    val   :: a,
                    right :: BinaryTree a }
    deriving Show

empty :: BinaryTree a
empty = Leaf

singleton :: a -> BinaryTree a
singleton x = BinaryTree Leaf x Leaf

node ::  BinaryTree a -> a -> BinaryTree a -> BinaryTree a
node l x r = BinaryTree {left=l, val=x, right=r}

-- Traverse a Binary Tree (DF)
dfTraverse_inorder :: BinaryTree a -> [a]
dfTraverse_inorder Leaf = []
dfTraverse_inorder tree = dfTraverse_inorder (left tree) ++ [val tree] ++ dfTraverse_inorder (right tree)

-- Traverse a Binary Tree (DF)
dfTraverse_preorder :: BinaryTree a -> [a]
dfTraverse_preorder Leaf = []
dfTraverse_preorder tree = [val tree] ++ dfTraverse_preorder (left tree) ++ dfTraverse_preorder (right tree)

-- Traverse a Binary Tree (DF)
dfTraverse_postorder :: BinaryTree a -> [a]
dfTraverse_postorder Leaf = []
dfTraverse_postorder tree = dfTraverse_postorder (left tree) ++ dfTraverse_postorder (right tree) ++ [val tree]

sampleTree :: BinaryTree Int
sampleTree = node l 1 r
    where
        l = node ll 2 rl
        r = node lr 3 rr
        ll = node lll 4 rll
        rl = node lrl 5 rrl
        lr = node llr 6 rlr
        rr = node lrr 7 rrr
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
    let tree = sampleTree
        inorder   = dfTraverse_inorder tree
        preorder  = dfTraverse_preorder tree
        postorder = dfTraverse_postorder tree
    putStrLn "In order depth first traversal"
    print inorder

    putStrLn "In order depth first traversal"
    print preorder

    putStrLn "In order depth first traversal"
    print postorder