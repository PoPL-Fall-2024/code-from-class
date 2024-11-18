import System.Random

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

-- Function that takes a StdGen and produces a tuple of 3 random Ints
threeInts :: StdGen -> (Int, Int, Int)
threeInts gen = (int1, int2, int3)
    where (int1, gen1) = random gen
          (int2, gen2) = random gen1
          (int3, gen3) = random gen2

-- *Main System.Random> :t randoms
-- randoms :: (Random a, RandomGen g) => g -> [a]

-- randoms gives an infinite list of random things
-- does not return an RNG state, because it always uses the next
-- state to produce the next random thing

-- practice:
-- write a function that generates random Ints until one has at least ten 7's in it

count7s 0 = 0
count7s n
    | n < 0 = count7s (-n)
    | n `mod` 10 == 7 = 1 + count7sTail
    | otherwise = count7sTail
    where count7sTail = count7s (n `div` 10)

ten7s n = (count7s n) >= 10

firstRandomIntGTten7s gen = head $ filter ten7s $ randoms gen


----- random numbers from a range
-- randomR takes a range as a tuple as well as a generator

-- > :t randomR
-- randomR :: (Random a, RandomGen g) => (a, a) -> g -> (a, g)

-- randomRs gives an infinite sequence of things from a range

--- What if we want random numbers in a real program, so that every
--- time we run the program, it produces different numbers

-- use getStdGen
-- > :t getStdGen
-- getStdGen :: IO StdGen

-- This produces a StdGen using something from the system (system time)
-- as the seed
-- Since this gives a different seed each time you run it, it is impure
-- so it returns an IO action containing the StdGen

main1 = do
    gen <- getStdGen
    print $ take 5 $ (randomRs (1, 6) gen :: [Int])


-- NOTE: getStdGen does not update the global generator's
-- state, so we can't simply use it twice
main2 = do
    gen <- getStdGen
    print $ take 5 $ (randomRs (1, 6) gen :: [Int])
    gen2 <- getStdGen
    print $ take 5 $ (randomRs (1, 6) gen2 :: [Int])

main3 = do
    gen <- getStdGen
    print $ take 5 $ (randomRs (1, 6) gen :: [Int])
    gen2 <- newStdGen
    print $ take 5 $ (randomRs (1, 6) gen2 :: [Int])
    gen3 <- newStdGen
    print $ take 5 $ (randomRs (1, 6) gen3 :: [Int])

main = do
    gen <- getStdGen
    let rolls = randomRs (1,6) gen
        tries = numsUntilYahtzee $ rolls
    print tries
    print $ take 5 $ drop tries rolls

numsUntilYahtzee :: [Int] -> Int
numsUntilYahtzee allRolls@(r1:r2:r3:r4:r5:_)
    | r1 == r2 && r2 == r3 && r3 == r4 && r4 == r5 = 0
    | otherwise = 1 + (numsUntilYahtzee $ tail allRolls)


