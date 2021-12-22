data Person = Person String Int

-- Record: Named arguement. From the definition automatically functions are generated, namely name and age

data Person' = Person' {
                        name :: String,
                        age :: Int
                        }

greet :: Person' -> [Char]
greet (Person' n _) = "Hi " ++ n

