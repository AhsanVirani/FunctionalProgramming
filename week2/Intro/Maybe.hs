data NonEmpty a = One a | Cons a (NonEmpty a)

safeHead :: NonEmpty a -> a
safeHead (One a) = a
safeHead (Cons a _) = a

safediv :: Integral a => a -> a -> Maybe a
safediv a b = 
    if b == 0 then Nothing else Just $ div a b