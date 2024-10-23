(ns code-from-class.infinite-sequences)


;; Lazy Sequences
;; Many functions return a lazy sequence
;; The elements of a lazy sequence are only computed when you need them

(take 5
      (filter even?
              (range 1000000000)))
;;=> (0 2 4 6 8)

(take 10 (filter even?(range 6)))
;;=> (0 2 4)

(nth (filter even?
             (range 10000000000))
     65)
;;=> 130


;; Infinite sequences
;; allows us to store an infinite sequence lazily, only retrieving elements
;; when we need to use them
;; look at a few ways to create infinite sequences

;; range
(range)
;;=> (0
;;    1
;;    2
;;    3
;;    4
;;    5
;;    6
;;    7
;;    8
;;    9
;;    10
;;    11
;;    12
;;    13
;;    14
;;    15
;;    16
;;    17
;;    18
;;    19
;;    20
;;    21
;;    22
;;    23
;;    24
;;    25
;;    26
;;    27
;;    28
;;    29
;;    30
;;    31
;;    32
;;    33
;;    34
;;    35
;;    36
;;    37
;;    38
;;    39
;;    40
;;    41
;;    42
;;    43
;;    44
;;    45
;;    46
;;    47
;;    48
;;    49
;;    50
;;    51
;;    52
;;    53
;;    54
;;    55
;;    56
;;    57
;;    58
;;    59
;;    60
;;    61
;;    62
;;    63
;;    64
;;    65
;;    66
;;    67
;;    68
;;    69
;;    70
;;    71
;;    72
;;    73
;;    74
;;    75
;;    76
;;    77
;;    78
;;    79
;;    80
;;    81
;;    82
;;    83
;;    84
;;    85
;;    86
;;    87
;;    88
;;    89
;;    90
;;    91
;;    92
;;    93
;;    94
;;    95
;;    96
;;    97
;;    98
;;    99
;;    ...)

(take 5 (range))
;;=> (0 1 2 3 4)

; same:
(range 5)
;;=> (0 1 2 3 4)

(nth (range) 10)
;;=> 10

(take 10
      (filter (fn [x] (> x 1000))
              (range)))
;;=> (1001 1002 1003 1004 1005 1006 1007 1008 1009 1010)


(take 10 (map #(* % %)
              (range)))
;;=> (0 1 4 9 16 25 36 49 64 81)


; how would we find the first square number above 1 million?
(first
 (filter (fn [x] (> x 1000000))
         (map #(* % %)
              (range))))
;;=> 1002001

;; repeat - creates an infinite sequence of a value repeated
(take 5 (repeat :hi))
;;=> (:hi :hi :hi :hi :hi)

(repeat 5 :hi)
;;=> (:hi :hi :hi :hi :hi)

;; repeatedly - creates an infinite sequence of calls to a function

(rand)
;;=> 0.9125988862378732

(take 5 (repeatedly rand))
;;=> (0.05855665140171551 0.7660465389399442 0.9824658710030478 0.6048628983577939 0.764634754270146)

(repeatedly 5 rand) ;; same as above
;;=> (0.6226578126033969 0.32286857671459324 0.9450583968288542 0.5555102854208717 0.007674699607019497)

(take 5 (repeatedly list))
;;=> (() () () () ())

(def numbers (range 4 20))
;;=> #'code-from-class.infinite-sequences/numbers

numbers
;;=> (4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19)

(take 5
      (repeatedly #(rand-nth numbers)))
;;=> (14 5 18 16 15)
;;=> (12 12 8 8 11)

(take 10
      (map #(+ 1000 %)
           (repeatedly #(rand-nth numbers))))
;;=> (1019 1011 1008 1019 1015 1013 1007 1011 1017 1009)

;; no:
;; (rand-nth (range))

;; (iterate fn x) - creates an infinite sequence of:
;; (x, (fn x), (fn (fn x)), (fn (fn (fn x))), ...)

(take 7 (iterate inc 10))
;;=> (10 11 12 13 14 15 16)

(take 8 (iterate list :hello))
;;=> (:hello (:hello) ((:hello)) (((:hello))) ((((:hello)))) (((((:hello))))) ((((((:hello)))))) (((((((:hello))))))))

(nth (iterate list :hello) 100000)
;;=> Error printing return value (StackOverflowError) at clojure.lang.RT/assoc (RT.java:847).
;;   null
;;   

;; inf seq of powers of 2: (1 2 4 8 16 ...)

(def powers-of-two
  (iterate #(*' % 2)
           1))

(take 10 powers-of-two)
;;=> (1 2 4 8 16 32 64 128 256 512)

; 2 ^ 100
(nth powers-of-two 100)
;;=> 1267650600228229401496703205376N


(def infinite-foobar
  (iterate (fn [s] (str s "bar"))
           "foo"))

(take 5 infinite-foobar)
;;=> ("foo" "foobar" "foobarbar" "foobarbarbar" "foobarbarbarbar")

;; find the first element with more than 40 characters
(first (filter #(> (count %) 40)
               infinite-foobar))
;;=> "foobarbarbarbarbarbarbarbarbarbarbarbarbar"

(count "foobarbarbarbarbarbarbarbarbarbarbarbarbar")
;;=> 42

;; infinite fibonacci sequence
;; need to track not just the previous element, but the previous 2 elements
;; we will first create:
;; ([0 1] [1 1] [1 2] [2 3] [3 5] [5 8] ...)

(defn next-fib-pair
  [[two-back one-back]]
  [one-back (+' two-back one-back)])

(next-fib-pair [3 5])
;;=> [5 8]

(def fib-sequence
  (map first
       (iterate next-fib-pair [0 1])))

(take 10 fib-sequence)
;;=> (0 1 1 2 3 5 8 13 21 34)

(defn fast-fib
  "Returns the nth fib number"
  [n]
  (nth fib-sequence n))

(fast-fib 100)
;;=> 354224848179261915075N

(fast-fib 1000)
;;=> 43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875N

