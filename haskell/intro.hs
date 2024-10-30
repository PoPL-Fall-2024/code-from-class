
-- use ghci to run a REPL and interpret code
-- use ghc to compile source code

Prelude> 5 + 2
7
Prelude> 4.3 * 3.1
13.33
Prelude> 65 / 7
9.285714285714286
Prelude> div 65 7
9
Prelude> 65 `div` 7
9
Prelude> 7 * (52 - 31)
147
Prelude> succ 4
5
Prelude> max 42 23
42
Prelude> max 42 23 56

<interactive>:9:1: error:
    • Non type-variable argument in the constraint: Ord (t1 -> t2)
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall t1 t2. (Ord (t1 -> t2), Num t1, Num (t1 -> t2)) => t2
Prelude> max 32.4 56.7
56.7
Prelude> 42 `max` 84
84
Prelude> (+) 2 5
7
Prelude> + 2 5

<interactive>:13:1: error: parse error on input ‘+’
Prelude> 5 == 6
False
Prelude> 23.1 >= 4.2
True
Prelude> "hat" == "hat"
True
Prelude> "hat" == 7

<interactive>:17:10: error:
    • No instance for (Num [Char]) arising from the literal ‘7’
    • In the second argument of ‘(==)’, namely ‘7’
      In the expression: "hat" == 7
      In an equation for ‘it’: it = "hat" == 7
Prelude> 5.3 == 6
False
Prelude> (==) "hat" "cat"
False
Prelude> odd 5
True
Prelude> even 5
False
Prelude> "abc"
"abc"
Prelude> 'a'
'a'
Prelude> ['a', 'b', 'c']
"abc"

-- For functions, arguments are separated
-- by spaces, no need for parentheses
div 65 7

-- we can use a function that takes 2 arguments
-- as infix if we surround it with `backticks`

-- infix = operator comes between its arguments

-- functions that use letters are by default prefix
-- functions that use special characters, like + and /, are by default infix

-- special character functions we can make prefix by surrounding with parentheses:
-- (+) 2 5

-- use :t to check the type of something

Prelude> :t 4
4 :: Num p => p
Prelude> :t 13.6
13.6 :: Fractional p => p
Prelude> :t 'r'
'r' :: Char
Prelude> :t "asd"
"asd" :: [Char]
Prelude> :t [1,2,3]
[1,2,3] :: Num a => [a]
Prelude> [1, 'a']

<interactive>:30:2: error:
    • No instance for (Num Char) arising from the literal ‘1’
    • In the expression: 1
      In the expression: [1, 'a']
      In an equation for ‘it’: it = [1, 'a']
Prelude> Integer :: 5

<interactive>:31:12: error:
    Illegal type: ‘5’ Perhaps you intended to use DataKinds
Prelude> 5 :: Integer
5
Prelude> :t (5 :: Integer)
(5 :: Integer) :: Integer
Prelude> :t (5 :: Float)
(5 :: Float) :: Float
Prelude> :t 5
5 :: Num p => p
Prelude> [5, 5.2, 6]
[5.0,5.2,6.0]
Prelude> :t [5, 5.2, 6]
[5, 5.2, 6] :: Fractional a => [a]
Prelude> [5, 5.2, 6] :: [Float]
[5.0,5.2,6.0]
Prelude> [5, 5.2, 6] :: [Integer]

<interactive>:39:5: error:
    • No instance for (Fractional Integer)
        arising from the literal ‘5.2’
    • In the expression: 5.2
      In the expression: [5, 5.2, 6] :: [Integer]
      In an equation for ‘it’: it = [5, 5.2, 6] :: [Integer]
Prelude> (5 :: Integer) == 5.6

<interactive>:40:19: error:
    • No instance for (Fractional Integer)
        arising from the literal ‘5.6’
    • In the second argument of ‘(==)’, namely ‘5.6’
      In the expression: (5 :: Integer) == 5.6
      In an equation for ‘it’: it = (5 :: Integer) == 5.6
Prelude> (5 :: Integer) == 5
True
Prelude> :t True
True :: Bool

-- lists must be homogeneous -- all elements are same type

Prelude> [1,2,3,4]
[1,2,3,4]
Prelude> head [1,2,3,4]
1
Prelude> tail [1,2,3,4]
[2,3,4]
Prelude> [1,2,3,4] ++ [5,6,7]
[1,2,3,4,5,6,7]
Prelude> [1,2,3,4] + [5,6,7]

<interactive>:47:1: error:
    • Non type-variable argument in the constraint: Num [a]
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a. (Num a, Num [a]) => [a]
Prelude> [1,2,3,4] ++ [5,6,7]
[1,2,3,4,5,6,7]
Prelude> 0 : [1,2,3,4]
[0,1,2,3,4]
Prelude> tail []
*** Exception: Prelude.tail: empty list
Prelude> [1.1, 2.2, 3.3, 4.4] !! 2
3.3
Prelude> "hello" ++ "world"
"helloworld"
Prelude> 'a' : " good book"
"a good book"
Prelude> "haskell" !! 3
'k'
Prelude> length [1,2,3]
3
Prelude> null []
True
Prelude> null [1,2,3]
False
Prelude> reverse "haskell"
"lleksah"
Prelude> take 5 [1,2,3,4,5,6,7,8]
[1,2,3,4,5]
Prelude> elem 2 [1,2,3,4]
True
Prelude> elem 52 [1,2,3,4]
False
Prelude> elem 'a' "hat"
True
Prelude> elem 'a' [1,2,3]

<interactive>:63:11: error:
    • No instance for (Num Char) arising from the literal ‘1’
    • In the expression: 1
      In the second argument of ‘elem’, namely ‘[1, 2, 3]’
      In the expression: elem 'a' [1, 2, 3]
Prelude> '4'
'4'
Prelude> ord '4'

<interactive>:65:1: error:
    • Variable not in scope: ord :: Char -> t
    • Perhaps you meant one of these:
        ‘or’ (imported from Prelude), ‘odd’ (imported from Prelude)
Prelude> [1, "hi"]

<interactive>:66:2: error:
    • No instance for (Num [Char]) arising from the literal ‘1’
    • In the expression: 1
      In the expression: [1, "hi"]
      In an equation for ‘it’: it = [1, "hi"]
Prelude> ["hi", "there"]
["hi","there"]
Prelude> :t ["hi", "there"]
["hi", "there"] :: [[Char]]
Prelude> ["hi", "there", 'u']

<interactive>:69:17: error:
    • Couldn't match expected type ‘[Char]’ with actual type ‘Char’
    • In the expression: 'u'
      In the expression: ["hi", "there", 'u']
      In an equation for ‘it’: it = ["hi", "there", 'u']

Prelude> ["hi", "there", "u"]
["hi","there","u"]

-- ranges

Prelude> [0..10]
[0,1,2,3,4,5,6,7,8,9,10]
Prelude> [1,3..30]
[1,3,5,7,9,11,13,15,17,19,21,23,25,27,29]
Prelude> [10,9..0]
[10,9,8,7,6,5,4,3,2,1,0]
Prelude> ['a'..'t']
"abcdefghijklmnopqrst"
Prelude> ['G'..'g']
"GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefg"
Prelude> [1..]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16, ...]

-- list comprehensions - allow us to do things like mapping and filtering
--        a list with a convenient syntax
-- syntax: [what to do with var | var <- list, constraints on var]

Prelude> [x + 5 | x <- [1..10]]
[6,7,8,9,10,11,12,13,14,15]
Prelude> odd 5
True
Prelude> [x + 5 | x <- [1..10], odd x]
[6,8,10,12,14]
Prelude> [x | x <- [1..10], odd x]
[1,3,5,7,9]
Prelude> [-cat | cat <- [1..20], cat * cat < 100, odd cat]
[-1,-3,-5,-7,-9]
Prelude> [x + y | x <- [1..5], y <- [100, 200, 300]]
[101,201,301,102,202,302,103,203,303,104,204,304,105,205,305]
Prelude> [x + y | x <- [1..5], y <- [100, 200, 300], x * y > 200]
[301,202,302,103,203,303,104,204,304,105,205,305]
Prelude> [(color, fruit) | color <- ["red", "blue", "green"], fruit <- ["apple", "plum", "
mango"]]
[("red","apple"),("red","plum"),("red","mango"),("blue","apple"),("blue","plum"),("blue","mango"),("green","apple"),("green","plum"),("green","mango")]
Prelude> [c | c <- "Hello There World", elem c ['a'..'z']]
"ellohereorld"


-- tuples -- can be heterogeneous -- can have elements of different types
-- fixed length

Prelude> (1, 2.5, "hi")
(1,2.5,"hi")
Prelude> :t (1, 2.5, "hi")
(1, 2.5, "hi") :: (Fractional b, Num a) => (a, b, [Char])