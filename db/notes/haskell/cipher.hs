import Data.Char
--cipher0 :: [Char] -> Int -> [Char]

cipher chars x = map (\ch -> chr ((mod ((ord ch - 97) + 13) 26) + 97)) chars
