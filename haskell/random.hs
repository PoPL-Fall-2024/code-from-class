
-- Because Haskell is purely functional, every function,
-- given the same arguments, must return the same value

-- But, we want a random number generator to return
-- different values when we call it

-- How do random number generators (RNG) work?
-- A pseudorandom number generator has a state, which is
-- updated with each call to it
-- Ex: newNum = (a * prevNum + b) mod m
-- where a, b, and m are large integers, and prevNum is
-- the previous state of the RNG.

-- In most languages, the state of the RNG is tracked in
-- some mutable state somewhere

-- Since Haskell can't change the state of the RNG,
-- functions that produce random numbers also return
-- the next state of the RNG
-- Then, we can use that next state to produce another random
-- number, etc.

-- > :t random
-- random :: (Random a, RandomGen g) => g -> (a, g)

-- > :t mkStdGen
-- mkStdGen :: Int -> StdGen

-- msStdGen takes an Int and returns a RNG in a particular state
-- since it is a pure function, given the same input (seed), it always returns the same RNG state
