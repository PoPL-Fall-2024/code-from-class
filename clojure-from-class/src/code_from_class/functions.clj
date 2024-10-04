(ns code-from-class.functions)

; let
; allows you to bind values to symbols within a lexical context
; => local bindings
; let is your friend, you should use it often!
(let [nums '(7 2 3 3 1)
      the-first (first nums)]
  (* the-first (last nums)))
;;=> 7

nums
;;=> Syntax error compiling at (src/code_from_class/functions.clj:0:0).
;;   Unable to resolve symbol: nums in this context
;;   

; def - only used at outermost level to create global constants


(let [nums '(7 2 3 3 1)]
  (println nums)
  (println (conj nums 100))
  (println nums)
  (rest nums))
;;=> (2 3 3 1)

; NOTE: no pure functions change values associate with symbols!
; ALSO: let statement returns the last expression inside it

; defn - define a function

(defn square
  "Squares the input x.
   This is a docstring!"
  [x]
  (* x x))

(square 5)
;;=> 25

(square 3.6)
;;=> 12.96

(square (/ 2 3))
;;=> 4/9

(square "hi")
;;=> Execution error (ClassCastException) at code-from-class.functions/square (REPL:36).
;;   java.lang.String cannot be cast to java.lang.Number
;;   

(type square)
;;=> code_from_class.functions$square

;; ad-hoc polymorphism - defined on some types and not others

;; defn is equivalent to def of a function value
(def cube
  (fn [x]
    (* x x x)))

(cube 4)
;;=> 64

(defn hi
  []
  (println "hello!"))

(hi)
;;=> nil

(defn print-strings-and-concatenate
  "Just like with let, defn can do multiple steps and then
   return the last expression that is evaluated."
  [string1 string2]
  (println string1 "and other stuff")
  (println string2)
  (str string1 string2))

(print-strings-and-concatenate "hi" "there")
;;=> "hithere"

; if - if the first argument is true, RETURNS the first thing; otherwise,
;      RETURNS the second thing

(if (< 1 4)
  (str 1 " is smaller")
  (str 4 " is smaller"))
;;=> "1 is smaller"

(if (and (> 1 4) (= 5 7))
  :cs220
  :nope)
;;=> :nope

; when - gives you then without else clause
; returns nil if condition is false
(when (= 4 4)
  (println "yay"))
;;=> nil

(when false
  (println "boo!"))
;;=> nil

(if false
  (println "boo!")
  nil)

(defn how-big
  "Tells how big a number is!"
  [num]
  (cond
    (< num 0) "Your number is so negative!"
    (< num 10) "A single digit"
    (< num 100) "Double digit, a bit bigger"
    :else (str "OMG " num " is SOOOOO BIG!")))
;;=> #'code-from-class.functions/how-big

(how-big 5)
;;=> "A single digit"

(how-big 2999)
;;=> "OMG 2999 is SOOOOO BIG!"

:else
;;=> :else

;; :else is just a keyword
;; any value in Clojure is "truthy" besides false and nil

(if 0
  :a
  :b)
;;=> :a

(type 0)
;;=> java.lang.Long

(type true)
;;=> java.lang.Boolean

(= false nil)
;;=> false

(= false false)
;;=> true


; maps
(def fruit
  {:apples 4, :bananas 6, :cantaloupes 10})

;; associate
(assoc fruit :strawberry 5)
;;=> {:apples 4, :bananas 6, :cantaloupes 10, :strawberry 5}

fruit
;;=> {:apples 4, :bananas 6, :cantaloupes 10}

(str (assoc fruit :strawberry 5))
;;=> "{:apples 4, :bananas 6, :cantaloupes 10, :strawberry 5}"

(assoc (fruit) :strawberry 5)
;;=> Execution error (ArityException) at code-from-class.functions/eval10276 (REPL:164).
;;   Wrong number of args (0) passed to: clojure.lang.PersistentArrayMap
;;   

(assoc fruit :blueberries 100)
;;=> {:apples 4, :bananas 6, :cantaloupes 10, :blueberries 100}

(def new-fruit (assoc fruit :blueberries 100))

new-fruit
;;=> {:apples 4, :bananas 6, :cantaloupes 10, :blueberries 100}

(assoc new-fruit :lemons 1)
;;=> {:apples 4, :bananas 6, :cantaloupes 10, :blueberries 100, :lemons 1}