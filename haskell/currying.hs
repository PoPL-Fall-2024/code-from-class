
multThenAdd x y z = (x * y) + z

multBy5ThenAdd y z = (5 * y) + z
-- equivalent to:
multBy5ThenAdd' y z = multThenAdd 5 y z
-- equivalent to:
-- multBy5ThenAdd'' :: Num a => a -> a -> a
multBy5ThenAdd'' = multThenAdd 5

-- this is a _partially applied function_
-- we call a function without providing all of its argumenets
-- this returns a new function that takes any of
-- the arguments that we did not provide

-- we can do the same with built-in functions

divide100 x = div 100 x
--equivalent to
divide100' = div 100

add5 x = x + 5
--equivalent to
add5' = (+ 5) -- 5 is the second argument
add5'' = (5 +) -- 5 is the first argument

equalsA x = 'A' == x
--equivalent to
equalsA' = ('A' ==) -- 'A' is the first argument to ==

divideBy14 x = div x 14
-- equivalent to
divideBy14' = (`div` 14)

-- We can use partially applied functions as anon fns to pass to HOFs


-- _currying_ takes a function with multiple arguments
-- and breaks it into multiple function applications,
-- each of which takes only 1 argument

-- every function application in Haskell uses currying
-- (almost) every function in Haskell really only
-- takes 1 argument

-- (+) :: Num a => a -> a -> a
-- (+) :: Num a => a -> (a -> a)
-- tells us: + is a function that takes a number, and returns
-- [a function that takes a number and returns a number]

-- multThenAdd :: Num a => a -> a -> a -> a
-- multThenAdd :: Num a => a -> (a -> (a -> a))
--- NOT equivalent to:
-- multThenAdd :: Num a => (a -> a) -> a -> a

-- (==) :: Eq a => a -> a -> Bool
-- (==) :: Eq a => a -> (a -> Bool)

-- so, when we partially apply a function, we are getting back
-- a function of the remaining arguments.

-- map :: (a -> b) -> [a] -> [b]
-- map :: (a -> b) -> ([a] -> [b])

mapSquare = map (^ 2)

-- filter :: (a -> Bool) -> [a] -> [a]
-- filter :: (a -> Bool) -> ([a] -> [a])

filterEven = filter even

-- anon function syntax in Haskell
-- (\x -> x + 3)
-- equivalent to:
-- (+ 3)

longWords words = filter (\x -> length x >= 5) words