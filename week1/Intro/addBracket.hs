addBracket s = "[" ++ s ++ "]"

result = map addBracket ["one", "two", "three"]

main = print result