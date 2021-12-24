-- Define a function type
newtype Func a b = Func (a -> b)

-- Compose function takes in two functions Func and composes them together 
compose :: Func a b -> Func b c -> Func a c
compose (Func f) (Func g) = Func (g . f)

---- Apply function takes our data type Func and applies an arguement to it
apply :: Func a b -> a -> b
apply (Func f) a = f a