import Data.Functor
import Control.Applicative

-- Mapping a list
multiplyLists :: Num a => [a] -> [a] -> [a]
multiplyLists xs ys = (*) <$> xs <*> ys

-- Mapping a maybe
tupleMaybe :: Maybe a -> Maybe b -> Maybe (a, b)
tupleMaybe x y = (,) <$> x <*> y

-- Add either
addEither :: Num a => Either c a -> Either c a -> Either c a
addEither x y = pure (+) <*> x <*> y

main :: IO ()
main = do
    putStrLn "multiply lists"
    putStrLn $ show $ multiplyLists [1..3] [11..13]
    putStrLn ""
    putStrLn "Tuples of maybes"
    putStrLn "Just 10 -> Just \"String\" -> Just(10, \"String\")"
    putStrLn $ show $ tupleMaybe (pure 10) (Just "String")
    putStrLn ""
    putStrLn "Just 10 -> Nothing -> Nothing"
    putStrLn $ (show :: Maybe (Int, String) -> String) $ tupleMaybe (Just 10) Nothing
    putStrLn ""
    putStrLn "Adding Either"
    putStrLn "Right 10 -> Right 100 -> Right 110"
    putStrLn $ (show :: Either String Int -> String) $ addEither (Right 10) (Right 100)

    putStrLn "Left String -> Right 10 -> Left String"
    putStrLn $ (show :: Either String Int -> String) $ addEither (Left "String") (Right 10)


-- Note: The pure function takes a value and creates a data type. For example, in the context of List, Maybe, and Either, the pure function will fetch the following values:
    -- pure 10 :: [Int] = [10]  -- in the context of List
    -- pure 10 :: Maybe Int = Just 10 -- in the context of Maybe
    -- pure 10 :: Either String Int = Right 10 -- in the context of Either