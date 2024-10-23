(ns code-from-class.closures)

;; a HOF that returns a function

(defn square-old
  [x]
  (* x x))

(def square-silly
  (fn [x]
    (* x x)))

(defn cube-old
  [x]
  (* x x x))

(defn to-the-tenth
  [x]
  (apply * (repeat 10 x)))

(to-the-tenth 2)
;;=> 1024

(to-the-tenth 7)
;;=> 282475249

(defn powerer
  "Returns a function that raises the argument to exponent power"
  [exponent]
  (fn [argument]
    (apply * (repeat exponent argument))))

;; The function that powerer is returning is called a _closure_
;; closure: is a function with an environment, which gives each "free variable"
;; a value at the time that the function is created
;; In this example, exponent is the free variable

(def cube (powerer 3))
;;=> #'code-from-class.closures/cube

(cube 5)
;;=> 125

(def to-the-tenth-new (powerer 10))
;;=> #'code-from-class.closures/to-the-tenth-new

(to-the-tenth-new 2)
;;=> 1024

(to-the-tenth-new 7)
;;=> 282475249

((powerer 3) 5)
;;=> 125

(defn concat-string-with
  "Returns a function that takes a string and concats it onto start-string"
  [start-string]
  (fn [s]
    (str start-string s)))

(def say-hello (concat-string-with "hello "))

(say-hello "Susan")
;;=> "hello Susan"

(say-hello 789)
;;=> "hello 789"

(def t-minus (concat-string-with "T-Minus "))
;;=> #'code-from-class.closures/t-minus

(t-minus 10)
;;=> "T-Minus 10"

(map t-minus (range 10 -1 -1))
;;=> ("T-Minus 10"
;;    "T-Minus 9"
;;    "T-Minus 8"
;;    "T-Minus 7"
;;    "T-Minus 6"
;;    "T-Minus 5"
;;    "T-Minus 4"
;;    "T-Minus 3"
;;    "T-Minus 2"
;;    "T-Minus 1"
;;    "T-Minus 0")

(defn log-fn-then-execute
  "Logs (prints) the function then executes it.
   Note: this function takes a function as an argument, and also returns
   a function."
  [f]
  (fn [& args]
    (println (conj args f))
    (apply f args)))

(def logged+ (log-fn-then-execute +))

(logged+ 4 3)
;;=> 7

(logged+ 4 5 9 1 100)
;;=> 119

(def logged-str (log-fn-then-execute str))
;;=> #'code-from-class.closures/logged-str

(logged-str "hello" 6 7 "there")
;;=> "hello67there"

'+
;;=> +

+'
;;=> #function[clojure.core/+']

(defn square
  [x]
  (* x x))

(def logged-square (log-fn-then-execute square))

(logged-square 5)
;;=> 25

(def logged-anon-cube (log-fn-then-execute #(* % % %)))
;;=> #'code-from-class.closures/logged-anon-cube

(logged-anon-cube 4)
;;=> 64

#(* % % %)
;;=> #function[code-from-class.closures/eval9916/fn--9917]