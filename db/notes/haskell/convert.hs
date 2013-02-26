convert :: (Double, [Char]) -> (Double, [Char])
convert (num, unit)
  | unit == "m"   = (1.09361 * num,"yd")
  | unit == "L"   = (0.264172 * num,"gal")
  | unit == "kg"  = (2.20462 * num,"lb")
  | unit == "yd"  = (num / 1.09361, "m")
  | unit == "gal" = (num / 0.26417, "L")
  | unit == "lb"  = (num / 2.20462, "kg")

-- how haskell deal with tuple
