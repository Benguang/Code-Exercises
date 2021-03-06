-- haskell useful idioms 
-- unpack tuple:     let (m, n, h) = toI l1
-- unpack array:     let [m, n, h] = toI l1

-- split string
split b = s b [""]
    where
        s "" r = r
        s x r
            | head x == ' ' = s (tail x) (r ++ [""])
            | otherwise = s (tail x) ((init r) ++ [((last r) ++ [(head x)])])
            
-- to binary 
toB :: Int -> [Int]
toB x = t x []
    where
        t 0 r = r
        t y r 
            | y `mod` 2 == 1 = t (y `div` 2) (1:r)
            | otherwise = t (y `div` 2) (0:r)
-- factorial with tail recursion
fact n = f n 1
    where 
        f 0 r = r
        f n r = f (n - 1) (r * n)

-- split a line into integer 
toI = map read $ words l :: [Int]
