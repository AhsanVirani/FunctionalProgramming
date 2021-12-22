-- Show type class is a set of types that can be converted to strings

class Show' a where
    show' :: a -> String 

instance Show' Bool where
    show' True = "True"
    show' False = "False"

