(ns code-from-class.higher-order-functions)

;; range - gives a list of numbers in a range
(def nums (range 4 12))
;;=> #'code-from-class.higher-order-functions/nums

nums
;;=> (4 5 6 7 8 9 10 11)

(range 15)
;;=> (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14)

;; higher-order functions!
;; functions that take other functions as arguments OR
;; functions that return functions

; apply
; passes all elements of a sequence as arguments to a function

; ex: sum all elements in nums
(+ nums)
;;=> Execution error (ClassCastException) at java.lang.Class/cast (Class.java:3369).
;;   Cannot cast clojure.lang.LongRange to java.lang.Number
;;   

(+ 6 2 83 21 35 -3)
;;=> 144

(apply + nums)
;;=> 60

; (apply fn (a b c)) is eqivalent to (fn a b c)

(str nums)
;;=> "(4 5 6 7 8 9 10 11)"

(apply str nums)
;;=> "4567891011"

(max nums)
;;=> (4 5 6 7 8 9 10 11)

(apply max nums)
;;=> 11

; map - same as in Ruby!
; apply a function to every element of a list and collect those results in
; a new list

(inc 5)
;;=> 6

(map inc nums)
;;=> (5 6 7 8 9 10 11 12)

(defn square
  [x]
  (* x x))

(square 5)
;;=> 25

nums
;;=> (4 5 6 7 8 9 10 11)

(map square nums)
;;=> (16 25 36 49 64 81 100 121)

(apply square nums) ;; equivalent to (square 4 5 6 7 8 9 10 11)
;;=> Execution error (ArityException) at code-from-class.higher-order-functions/eval10317 (REPL:69).
;;   Wrong number of args (8) passed to: code-from-class.higher-order-functions/square
;;   

;; anonymous function - a lot like a code block in Ruby, except it's an actual function
(map (fn [x] (* x 5))
     nums)
;;=> (20 25 30 35 40 45 50 55)

;; equivalent to:
;; % - argument to the anon function
;; this form should only be used for single-line, simple anon fns
(map #(* % 5)
     nums)
;;=> (20 25 30 35 40 45 50 55)

;; if you need multiple arguments, you can use %1 %2 %3 ...
;; %1 = %

; find the length of each string in a list
(map count '("what" "is" "this" "nonsense?"))
;;=> (4 2 4 9)

; write a function that tells if a list of strings is sorted by length
(defn sorted-by-length?
  [words]
  (apply <
         (map count words)))

(sorted-by-length? '("hi" "there" "its" "Monday"))
;;=> false

(sorted-by-length? '("a" "long" "longer" "list of words"))
;;=> true

(def people '({:name "Kelly" :age 22}
              {:name "Susan" :age 39}
              {:name "Bobby" :age 70}))

people
;;=> ({:name "Kelly", :age 22} {:name "Susan", :age 39} {:name "Bobby", :age 70})

(get {:name "Jared" :age 5} :name)
;;=> "Jared"

(:name {:name "Jared" :age 5})
;;=> "Jared"

(map #(get % :name) people)
;;=> ("Kelly" "Susan" "Bobby")

(map :name people)
;;=> ("Kelly" "Susan" "Bobby")

; HOF: filter
; filter same as in Ruby
; pass it a function that returns a boolean, collects all elements
; of the list that make that function return true

(filter even? nums)
;;=> (4 6 8 10)

(filter (fn [n] (> n 8))
        nums)
;;=> (9 10 11)

(defn find-all-words-of-length-5-or-more
  [words]
  (filter #(>= (count %) 5)
          words))

(find-all-words-of-length-5-or-more '("howdy" "hi" "hello" "hola" "elephant"))
;;=> ("howdy" "hello" "elephant")

; reduce
; interposes function calls between elements of a list

(reduce + nums)
;;=> 60

;; another way:
(apply + nums)
;;=> 60

(apply str nums)
;;=> "4567891011"

; optionally 3 arguments
; if so, second argument is the first value to pass to the function
(reduce + 100 nums)
;;=> 160

;;;        comma
(reduce (fn [x y] (str x ", " y))
        nums)
;;=> "4, 5, 6, 7, 8, 9, 10, 11"

; (comma (comma (comma (comma 4 5) 6) 7) 8)

(reduce #(str %1 ", " %2) nums)
;;=> "4, 5, 6, 7, 8, 9, 10, 11"

(interpose ", " nums)
;;=> (4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 10 ", " 11)

(str (interpose ", " nums))
;;=> "clojure.lang.LazySeq@afb2046f"

(apply str (interpose ", " nums))
;;=> "4, 5, 6, 7, 8, 9, 10, 11"

(reduce conj '() nums)
;;=> (11 10 9 8 7 6 5 4)
;;=> (11 10 9 8 7 6 5 4)

; (conj (conj '() 4) 5)

(reverse nums)
;;=> (11 10 9 8 7 6 5 4)

(reduce list nums)
;;=> (((((((4 5) 6) 7) 8) 9) 10) 11)

()
;;=> ()

'()
;;=> ()