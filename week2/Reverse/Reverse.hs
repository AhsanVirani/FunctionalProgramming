module Reverse where

import Prelude

reverse :: [a] -> [a]
reverse xs = reverse' xs []
    where
        reverse' [] rs = rs -- empty list
        reverse' (x:xs) rs = reverse' xs (x:rs)

