module Mezclar where 
    mezclarEnTernas :: [a] -> [b] -> [(a,b,b)]
    mezclarEnTernas xs ys = [(a,b,b)|  a <- [xs], b, b <-[ys]]