
multThenAdd x y z = (x * y) + z


multBy5ThenAdd y z = (5 * y) + z
-- equivalent to:
multBy5ThenAdd' y z = multThenAdd 5 y z
-- equivalent to:
multBy5ThenAdd'' = multThenAdd 5

-- this is a _partially applied function_
-- we call a function without providing all of its argumenets
-- this returns a new function that takes any of
-- the arguments that we did not provide

-- we can do the same with built-in functions

divide100 x = div 100 x
--equivalent to
divide100' = div 100