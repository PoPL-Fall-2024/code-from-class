
-- $ for function application

evenSquareSum lst = sum (map (^ 2) (filter even lst))

evenSquareSum' lst = sum $ map (^ 2) $ filter even lst

-- We can use $ for function application to pass the result
-- of one expression to the expression on the left
-- $ has the lowest precedence of any Haskell function,
-- so that both arguments (things on both sides of $) are
-- evaluated before the $ is evaluated itself

-- . - function composition
-- allows us to create a new function by composing (gluing together)
-- other functions