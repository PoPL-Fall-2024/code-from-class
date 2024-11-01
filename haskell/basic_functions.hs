module BasicFuntions where
-- this is a module name, and defines where these functions live

-- :l basic_funtions.hs -- this loads this file
-- :r - reloads most recently loaded file

-- this is a constant
list = [1, 3, 8, 10]

-- funtion syntax:
-- fn_name arg1 arg2 = function body

-- explicit type declaration
-- square :: Int -> Int
square :: Num a => a -> a
-- square :: Int -> Float --- this one won't work
square x = x * x

-- square :: Num a => a -> a
-- this takes a number and returns a number of the same type

concat3times :: String -> String
concat3times s = s ++ s ++ s

-- squares only odd integers
squareOdd x = if odd x
                then x * x
                else x

-- recursive factorial
-- We will use _pattern matching_ to determine base case and recursive case
fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n - 1)


--- Every expression in Haskell has a type
--- functions, literals, expressions -- all have types

myhead :: [a] -> a
-- what is a in this type signature?
-- a is a *type variable*, meaning that head takes
-- a list of any type of thing and returns something
-- of that type
-- type variable -- takes the place of a type, so that
-- the type can be different types

-- myhead :: [a] -> b -- we couldn't have this, because
-- running head on a list of integers must return an integer,
-- not something else

-- length :: Foldable t => t a -> Int
-- the way to read this:
-- Foldable means something we can iterate over, such as
-- a list.
-- Foldable a means a list of a, or something like it
-- This takes a list of type a and returns an Int

-- 5 :: Num p => p
-- Num is a *typeclass*
-- Says that 5 can be any type 'a', as long as 'a' is
-- in the typeclass Num
-- everything before => in a type signature is a class constraint
--    class constraint tells what the type variable is constrained by


-- 5, 5.2, and pi are all polymorphic constants
-- they can have different values depending on their type
