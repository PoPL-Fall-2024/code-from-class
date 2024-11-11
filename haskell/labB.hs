---- FROM PRE-LAB
fibTail 0 this next = this
fibTail n this next = fibTail (n - 1) next (this + next)

fib n = fibTail n 0 1

---- FROM THE START OF CLASS

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  

-- write our own sum function
sum' :: Num p => [p] -> p
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- write our own filter function
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' fn (x:xs)
    | fn x = x : filter' fn xs
    | otherwise = filter' fn xs

---- LAB ANSWERS

safeDiv :: Int -> Int -> Int
safeDiv _ 0 = maxBound :: Int
safeDiv x y = div x y

stringAfterSpace "" = ""
stringAfterSpace (' ':xs) = xs
stringAfterSpace (_:xs) = stringAfterSpace xs

stringUntilSpace "" = ""
stringUntilSpace (' ':xs) = ""
stringUntilSpace (x:xs) = x : (stringUntilSpace xs)

split :: String -> [String]
split "" = []
split s = stringUntilSpace s : (split $ stringAfterSpace s)
