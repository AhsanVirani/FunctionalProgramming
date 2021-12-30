import Prelude
-- Rounding grades exercise
-- Hacker Rank ex 2

-- Int array of all grades, return Int array of rounded grade
-- Rule 1: (grade - next multiple of 5) < 3 -> Round to next multiple of 5
-- Rule 2: < 38 then no rounding, fail

-- Function takes in the string from command line and convert to list of Int
getGrades :: String -> [Int]
getGrades x = read <$> words x :: [Int]

-- Rounding Function takes in an Int and returns a rounded Int
roundingFunc :: Int -> Int
roundingFunc num | num < 38       = num
roundingFunc num | mod num 5 == 0 = num
roundingFunc num                  = (ceiling $ fromIntegral num / 5) * 5

-- Apply rounding function to getGrades
roundedGrades :: String -> [Int]
roundedGrades x = roundingFunc <$> getGrades x
