(ns code-from-class.recursion)

(def nums (range 4 12))
;;=> #'code-from-class.recursion/nums

nums
;;=> (4 5 6 7 8 9 10 11)

(count nums)
;;=> 8

(defn my-count
  "Implements count using recursion"
  [lst]
  (if (empty? lst)
    0
    (inc (my-count (rest lst)))))

(my-count nums)
;;=> 8

(my-count (range 100))
;;=> 100

(my-count (range 10000))
;;=> Execution error (StackOverflowError) at code-from-class.recursion/my-count (REPL:15).
;;   null
;;   

(count (range 10000))
;;=> 10000


; 0 1 1 2 3 5 8 13
(defn fib
  "The nth fibonnaci number"
  [n]
  (cond
    (= n 0) 0
    (= n 1) 1
    :else (+ (fib (dec n))
             (fib (- n 2)))))

(fib 6)
;;=> 8

(map fib (range 20))
;;=> (0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181)

(fib 100)


(+ 1 2)
;;=> 3

(Math/pow 2 100)
;;=> 1.2676506002282294E30




;; arity - the number of parameters for a function
;; multi-arity function - can take different numbers of parameters

(defn my-reduce
  ([function coll]
   (my-reduce function (first coll) (rest coll)))
  ([function start-val coll]
   (if (empty? coll)
     start-val
     (my-reduce function
                (function start-val (first coll))
                (rest coll)))))

(reduce list '(:a :b :c :d))
;;=> (((:a :b) :c) :d)

(reduce + 100 '(5 6 7))
;;=> 118

(+ (+ (+ 100 5) 6) 7)
;;=> 118

(my-reduce list '(:a :b :c :d))
;;=> (((:a :b) :c) :d)

(my-reduce + 100 '(5 6 7))
;;=> 118

(reduce + (range 10000))
;;=> 49995000

(my-reduce + (range 10000))
;;=> Execution error (StackOverflowError) at code-from-class.recursion/my-reduce (REPL:80).
;;   null
;;   

(defn first-positive-in-list
  "Takes a list and returns the first positive number in the list.
  Returns nil if all numbers are negative"
  [numbers]
  (cond
    (empty? numbers) nil
    (< 0 (first numbers)) (first numbers)
    :else (first-positive-in-list (rest numbers))))

(first '())
;;=> nil

(first-positive-in-list '(-3 -7 4 -3 8 -4 1))
;;=> 4

(first-positive-in-list '(-2 -5 -7))
;;=> nil

(first-positive-in-list (range -10000 5))
;;=> Execution error (StackOverflowError) at code-from-class.recursion/first-positive-in-list (REPL:103).
;;   null
;;   


(defn first-positive-in-list-tail
  "Takes a list and returns the first positive number in the list.
  Returns nil if all numbers are negative"
  [numbers]
  (cond
    (empty? numbers) nil
    (< 0 (first numbers)) (first numbers)
    :else (recur (rest numbers))))

;; recur -- recursively calls the function
;; when you use recur, Clojure does not keep track of the recursive calls
;; on the call stack
;; this is _tail recursion_ -- only keeping one recursive call on the call stack
;; when we use recur for tail recursion, we cannot manipulate the returned
;; value in any way -- we simply have to return it


(first-positive-in-list-tail '(-3 -7 4 -3 8 -4 1))
;;=> 4

(first-positive-in-list-tail (range -10000 5))
;;=> 1


(defn my-reduce-tail
  ([function coll]
   (my-reduce-tail function (first coll) (rest coll)))
  ([function start-val coll]
   (if (empty? coll)
     start-val
     (recur function
            (function start-val (first coll))
            (rest coll)))))

(my-reduce-tail + (range 10000))
;;=> 49995000


(defn my-count-tail-bad
  "Implements count using recursion"
  [lst]
  (if (empty? lst)
    0
    (inc (recur (rest lst)))))
;;=> Syntax error (UnsupportedOperationException) compiling recur at (src/code_from_class/recursion.clj:165:10).
;;   Can only recur from tail position
;;   

; loop - simply sets the recursion point for recur, and declares
; parameters with their initial values
; think of loop as a helper function with a call to it within another function
; loop is not a loop!
; syntax: (loop [param-name init-value
;                param-name2 init-value2 ...])

(defn my-count-tail
  [in-lst]
  (loop [lst in-lst
         c 0] ;; c will be the count so far
    (if (empty? lst)
      c ;; return c, because it contains the number of elements we've seen so far
      (recur (rest lst)
             (inc c)))))

(my-count-tail '(:a :B :c :D))
;;=> 4

(my-count-tail (range 10000))
;;=> 10000
