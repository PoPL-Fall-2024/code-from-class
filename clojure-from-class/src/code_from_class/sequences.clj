(ns code-from-class.sequences)

;; Clojure's opinion: Better to use a small number of
;; common data structures with many functions defined
;; on each, rather than defining many classes of different
;; types of objects

;; sequences: lists and vectors
;; lists: implemented as linked lists
;; syntax: look like function calls! List: data is code

'(1 2 3)
;;=> (1 2 3)

(1 2 3)
;;=> Execution error (ClassCastException) at code-from-class.sequences/eval9052 (REPL:15).
;;   java.lang.Long cannot be cast to clojure.lang.IFn
;;   

'(+ 2 3)
;;=> (+ 2 3)

;; single quote = don't evaluate the following thing

'(1 (+ 2 3) 4)
;;=> (1 (+ 2 3) 4)

(quote (1 2 3))
;;=> (1 2 3)

(list 1 (+ 2 3) 4)
;;=> (1 5 4)

(list 1 (+ 2 3) '(5 6 7) 4)
;;=> (1 5 (5 6 7) 4)


;; vector
;; implemented as dynamic arrays

[1 2 3]
;;=> [1 2 3]

[1 (+ 2 3) 4]
;;=> [1 5 4]

'[1 (+ 2 3) 4]
;;=> [1 (+ 2 3) 4]

;; parametric polymorphism - we can mix types of things in
;; lists and arrays

'(5 :apple "hi" ("a" "list"))
;;=> (5 :apple "hi" ("a" "list"))

;; sequence functions: defined on list and vector
(def stuff '(:a :b :c :d :e))
;;=> #'code-from-class.sequences/stuff

stuff
;;=> (:a :b :c :d :e)

(first stuff)
;;=> :a

(first [1 2 3])
;;=> 1

(rest stuff)
;;=> (:b :c :d :e)

(count stuff)
;;=> 5

(nth stuff 3)
;;=> :d

;; parametric polymorphism -- these functions don't care
;; about the types of elements in the sequence

(first '(1 2 3))
;;=> 1

; conjoin

(conj '(10 11 12) \A)
;;=> (\A 10 11 12)

(conj [10 11 12] \A)
;;=> [10 11 12 \A]

;; ad-hoc polymorphism - behavior depends on type

; concatenate

(concat '(1 2 3) '(4 5 6))
;;=> (1 2 3 4 5 6)

(concat [1 2 3] [4 5 6])
;;=> (1 2 3 4 5 6)

(concat '(1 2 3) [4 5 6])
;;=> (1 2 3 4 5 6)
