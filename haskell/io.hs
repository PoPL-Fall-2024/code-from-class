
--- Printing
-- We can never change the state of anything in Haskell
-- This includes changing the state of the output device (printing)
-- and getting state from input devices such as the keyboard
-- Because Haskell is purely function, every function, given
-- the same inputs, must return the same output
--    -> this is not the case for something that reads a
--       string from the user

-- Hello World:
main1 = putStrLn "Hello World!"

-- main is an important function
-- it is run if the program is compiled and then run

-- Compile:
-- > ghc --make io.hs
-- > ./io

-- Interpret:
-- > runhaskell io.hs

-- GHCI:
-- > :l io.hs
-- > main

-- :t putStrLn
-- putStrLn :: String -> IO ()

-- This says that putStrLn takes a String and returns
-- and IO Action with a resulting type of () <--- empty tuple
-- An IO Action does something side-effecty with IO,
-- and has a return value (in this case, of an empty tuple)
--   -> think IO Action == impure
-- Since putStrLn has no meaningful return value, it returns
-- an empty tuple to indicate that the return value doesn't matter

-- 3 ways to run an IO Action:
-- 1. Give an IO action the name "main" and run the program
-- 2. Run the IO action (or a function that performs the IO
--    action) in GHCI
-- 3. Put the IO action inside a do block that is eventually
--    passed to main or a function called in GHCI

-- do blocks
-- To perform more than one IO action, we need a do block
-- do is a keyword
-- syntax: do, followed by one or more lines of IO operations
-- the last operation must return an IO action

main2 = do
    putStr "Enter your name: "
    name <- getLine
    putStrLn $ "HELLO " ++ name

-- getLine gets a line from standard input
-- Since getLine is not required to return the same value
-- when run twice, this is impure!
-- Must return an IO action

-- :t getLine
-- getLine :: IO String

-- This IO action contains a string
-- "<-" takes an IO action and exctracts its value, binding
-- that value to the thing to the left of the arrow
-- <- can only be used within another IO action (such as do)
-- since <- unboxes the IO action, the thing it has unboxed
-- is now pure data and can be passed to a pure function:

colorJudge color
    | color == "yellow" = "yellow is the best color!"
    | otherwise = color ++ " is ok, but not as good as yellow."

main3 = do
    putStr "Tell me your favorite color: "
    color <- getLine
    putStrLn $ colorJudge color


-- inside do blocks, we can't assign a variable / function like usual:

main4 = do
    putStr "Number please: "
    numStr <- getLine
    let addToInput x = x + (read numStr)
        mapped = map addToInput [2, 3, 5, 7, 11, 13]
    putStrLn $ "Adding " ++ numStr ++ " to the first 6 primes gives " ++ (show mapped)


-- Let's make our own function that returns an IO action
-- Any function that performs IO must return an IO action:

-- getInt that gets input from the user and returns it as an Int

getInt :: IO Int
getInt = do
    line <- getLine
    return $ read line

-- return means: take a pure value and box it up into an IO action