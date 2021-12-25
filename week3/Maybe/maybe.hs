import Data.Maybe

import System.Posix.ByteString (ControlCharacter(Interrupt))
main :: IO ()
main = do
    putStrLn "Using Maybe"

    let i = Just 10 :: Maybe Int
        j = Just 2  :: Maybe Int
        z = Just 0  :: Maybe Int

    putStrLn $ "Does (Just 10) represent a value? " ++
        show (isJust i)
    
    putStrLn $ "Does (Nothing) represent a value? " ++
        show (isJust Nothing)
    
    putStrLn $ "Does (Nothing) is really Nothing? " ++
        show (isNothing Nothing)
    
    putStrLn ""
    putStrLn $ "Singleton List and Maybe interoperability"
    putStrLn $ "Converting list [10] to maybe : " ++ (show $ listToMaybe [10])
    putStrLn $ "Converting empty list to Maybe (Nothing) : " ++ 
     (show $ (listToMaybe [] :: Maybe Int))
    
    putStrLn $ "converting Maybe (Just 10) to list: " ++ 
     (show $ maybeToList (Just 10))
    putStrLn $ "Converting Maybe (Nothing) to list: " ++ 
     (show $ maybeToList (Nothing :: Maybe Int))

    putStrLn ""
    putStrLn "Using default value for transformation using 'maybe'"
    putStrLn $ "Use NULL if Nothing, and convert a value to string if Maybe holds a value"

    let defaultNull     = "NULL"
        convertToString = maybe defaultNull show 
        null            = convertToString Nothing
        something       = convertToString (Just 10)
    
    putStrLn $ "Converting Nothing to String : " ++ null
    putStrLn $ "Converting value to String : " ++ something