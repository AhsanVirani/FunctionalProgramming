-- Function takes in string of numbers from cout, sum them up and turn them to string again
-- Hacker Rank ex1
sum_str_int_str :: String -> String
sum_str_int_str x = show $ sum $ read <$> (words x) :: String
