---- Prof. Helmuth's Answers

---- Prob 1

avgInts :: [Integer] -> Double
avgInts ints = (fromIntegral (sum ints)) / (fromIntegral (length ints))

---- Prob 2

addem upper = sum [x | x <- [1..upper], x `mod` 2 /= 0, x `mod` 3 /= 0]


---- Prob 3: Project Euler 30

-- Note: since 6 * 9^5 < 999999, there can't be a 7-digit number whose fifth
-- power sums are equal to itself
theRange = [2..999999]

-- Turns a positive integer into its digits recursively. Note that they
-- are in reverse order, but we don't care about that for this problem.
numToDigits 0 = []
numToDigits n = (n `mod` 10) : numToDigits (n `div` 10)

-- Takes the digits to the fifth power and sums them
toFifthAndSum n = sum [x ^ 5 | x <- numToDigits n]

-- I left this separate so we could see the numbers themselves
answerList = [n | n <- theRange, n == toFifthAndSum n]

answer = sum answerList


-- Prob 4

occurrences str ch = length [x | x <- str, x == ch]

superAnagram str1 str2 = length str1 == length [x | x <- str1, occurrences str1 x <= occurrences str2 x]

-- Prob 5

isPalindromeNumber :: Integer -> Bool
isPalindromeNumber x = show x == reverse (show x)

palindromeProducts nums = [x * y | x <- nums, y <- nums, isPalindromeNumber (x * y), x <= y]
