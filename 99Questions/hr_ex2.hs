import Prelude
-- Rounding grades exercise
-- Hacker Rank ex 2

-- Function takes in the string from command line and convert to list of Int
getGrades :: String -> [Int]
getGrades x = read <$> words x :: [Int]

-- Rounding Function takes in an Int and returns a rounded Int
roundingFunc :: Int -> Int
roundingFunc num 
    | num < 38 || diffConstraint = num
    | otherwise                  = (ceiling $ fromIntegral num / 5) * 5
    where diffConstraint = if mod num 5 < 3 then True else False

-- Apply rounding function to getGrades
roundedGrades :: String -> String
roundedGrades x = unlines $ show <$> (roundingFunc <$> getGrades x)
