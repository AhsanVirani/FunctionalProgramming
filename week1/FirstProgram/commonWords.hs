import Data.Char(toLower)
import Data.List ( group, sort, sortBy )

-- Given a number n and a string s, generate a report (in string form)
-- that lists the most common words in the string s

-- TASK
-- (1) Break the input string into words

breakIntoWords :: String -> [String]
breakIntoWords = words

-- (2) Convert the words to lowercase

convertIntoLowercase :: [String] -> [String]
convertIntoLowercase = map (map toLower)

-- (3) Sort the words

sortWords :: [String] -> [String]
sortWords = sort

-- (4) Count adjacent runs of the same word
type Run = (Int, String)
countAdjacentRuns :: [String] -> [Run]
countAdjacentRuns = convertToRuns . groupAdjacentRuns

-- group adjacent runs ['hello', 'hello', 'world'] -> [['hello', 'hello'], ['world']]
groupAdjacentRuns :: [String] -> [[String]]
groupAdjacentRuns = group

convertToRuns :: [[String]] -> [Run]
convertToRuns = map (\ls -> (length ls, head ls))

-- (5) Sort by size of the run

sortByRunSize :: [Run] -> [Run]
sortByRunSize = sortBy (\(l1, w1) (l2, w2) -> compare l2 l1)

-- (6) Take the first n runs in the sorted list

takeFirstN :: Int -> [Run] -> [Run]
takeFirstN = take 

-- (7) Generate a report

generateReport :: [Run] -> String
generateReport = unlines . map (\(l, w) -> w ++ ":" ++ show l)

mostCommonWords :: Int -> (String -> String)
mostCommonWords n =
 generateReport
 . takeFirstN n
 . sortByRunSize
 . countAdjacentRuns
 . sortWords
 . convertIntoLowercase
 . breakIntoWords
