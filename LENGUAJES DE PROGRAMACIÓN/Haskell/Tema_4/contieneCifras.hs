module ContieneCifra where
    contieneCifra :: Int->Int->Bool
    contieneCifra 0 0 = True
    contieneCifra _ 0 = False
    contieneCifrta x y = (x == y `mod` 10) || contieneCifra (x `div` 10) y