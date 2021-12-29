-- A Monoid assumes two behaviors:

    -- There is a default or empty value of the data type.
    -- Given two values of the data type, they can be combined to create a single value.

-- Defining Option datatype
data Option = Option { boolOption :: Bool, selections :: [String]}
    deriving Show


-- -- Defining instance of monoid
-- instance Semigroup Options => Monoid Option
--     where
--         mempty = Option False []
--         (Option b1 s1) `mappend` (Option b2 s2) = Option (b1 || b2) (s1 ++ s2)

-- main :: IO ()
-- main do 
--     putStrLn "Define default options"
--     let defaultOptions = mempty :: Option
--     putStrLn (show defaultOptions)

-- Monoid Class Definition
-- class Monoid a where
--     mempty  :: a
--     mappend :: a -> a -> a
--     mconcat :: [a] -> a


