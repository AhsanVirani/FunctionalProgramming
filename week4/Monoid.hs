-- A Monoid assumes two behaviors:

    -- There is a default or empty value of the data type.
    -- Given two values of the data type, they can be combined to create a single value.

-- Monoid Class Definition
class Monoid a where
    mempty  :: a
    mappend :: a -> a -> a
    mconcat :: [a] -> a