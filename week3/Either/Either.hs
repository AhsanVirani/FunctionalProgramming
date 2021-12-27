import Data.Either

-- Either data type
-- data Either a b = Left a | Right b
-- In many practices left value is used as error value and right value as intended result value

safeDiv :: Either String Int -> Either String Int -> Either String Int 
safeDiv (Left e) _ = Left e -- Any Left _ is an error, we produce the same result
safeDiv _ (Left e) = Left e -- error as a result
safeDiv (Right i) (Right j) | j == 0 = Left "Illegal Operation: Division by Zero"
safeDiv (Right i) (Right j) = Right (div i j)

main :: IO ()
main = do
    let i = Right 10 :: Either String Int
        j = Right 2 :: Either String Int
        z = Right 0 :: Either String Int
        x = Left "Ahsan" :: Either String Int
    
    putStrLn $ "Safe division: 10 / 2 = " ++ (show $ safeDiv i j)
    putStrLn $ "Safe division: 10 / 0 = " ++ (show $ safeDiv i z)
    putStrLn $ "Safe division: 'Ahsan' / 0 = " ++ (show $ safeDiv x z)