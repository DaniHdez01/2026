module Partir where 

    partir :: Int->[Int]->([Int], [Int])
    partir n xs = (take n xs, drop n xs)