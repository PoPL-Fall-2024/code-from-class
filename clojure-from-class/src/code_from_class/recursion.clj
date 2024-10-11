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