import Data.Char
strong :: String -> Bool
strong x = length x >= 15 && any isLower x && any isUpper x && any isDigit x
