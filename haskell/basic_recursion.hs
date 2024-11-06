
-- Turns a positive integer into its digits recursively. Note that they
-- are in reverse order, but we don't care about that for this problem.
-- Note: we'll use normal recursion in Haskell, we don't need tail recursion

digitsReverse 0 = []
digitsReverse x = (x `mod` 10) : digitsReverse (x `div` 10)

digits x = reverse (digitsReverse x)


-- even :: Integral a => a -> Bool
--        type constraint comes before =>
-- type constraints put constraints on type variables

square x = x * x

squareStr :: (Num a, Show a) => a -> String
squareStr x = show (x * x)

identity x = x

-- elem :: (Foldable t, Eq a) => a -> t a -> Bool
-- read as:
-- foldable means something you can iterate over.
-- such as a list.
-- this foldable contains elements of type a