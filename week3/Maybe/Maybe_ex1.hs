import Data.Maybe (fromJust)
import Data.Maybe (mapMaybe)
-- SafeOperation
safeOperation :: Num a => (a -> a -> Bool) -> (a -> a -> a) -> Maybe a -> Maybe a -> Maybe a
-- if any of the input is Nothing, then the output is Nothing
safeOperation _ _ Nothing _ = Nothing
safeOperation _ _ _ Nothing = Nothing 
-- if the condition is met, then the result is nothing.
safeOperation c _ (Just i) (Just j) | c i j = Nothing
-- normally call the operation
safeOperation c op (Just i) (Just j) = Just (i `op` j)

-- Doing Safe Division
    -- condition is satisfied when  denominator is zero

safeDiv :: Maybe Int -> Maybe Int -> Maybe Int
safeDiv = safeOperation divCondition div
    where
        divCondition _ 0 = True 
        divCondition _ _ = False

main :: IO ()
main = do
    let i = Just 10 :: Maybe Int
        j = Just 2  :: Maybe Int
        z = Just 0  :: Maybe Int
    putStrLn " "
    putStrLn $ "Getting value from (Just 10) = " ++ (show $ fromJust i)
    putStrLn $ "Safe Division - 10 / 2"
    let safeAnswer1 = safeDiv i j
    putStrLn $ "Answer is " ++ (show safeAnswer1)
    putStrLn $ "Safe Division by Zero - 10/0"
    let safeAnswer2 = safeDiv i z
    putStrLn $ "Answer is " ++ (show safeAnswer2)

    -- MapMaybe
    let evens = mapMaybe (\x -> if odd x then Nothing else (Just x)) [1..10]
    putStrLn $ "Filtering out odd elements - mapMaybe"
    putStrLn (show evens)