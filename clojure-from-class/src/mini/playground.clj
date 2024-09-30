(ns mini.playground)

; This project has custom configuration.
; See .vscode/settings.json

; If you are new to Calva, you may want to use the command:
; Calva: Create a “Getting Started” REPL project
; which creates a project with a an interactive Calva (and Clojure) guide.

; Basic arithmetic
(+ 2 7)
;;=> 9

(- 10 3)
;;=> 7

(* 1 2 3 4 5)
;;=> 120

(* 4)
;;=> 4

(*)
;;=> 1

(/ 6 27)
;;=> 2/9

(+ 1 2 (* 9 3) 8 (/ 34 11))
;;=> 452/11

(+ 3 7.31)
;;=> 10.309999999999999

-6
;;=> -6

(+ -3 8)
;=> 5

(defn add100to
  [x]
  (+ 100 x))
;;=> #'mini.playground/add100to

(add100to 7)
;;=> 107
 
;; core data types:
2999
;;=> 2999 ;; integer

-4.561
;;=> -4.561 ;; float

5/27
;;=> 5/27 ;; ratio!

true
;;=> true ;; boolean

false
;;=> false ;; boolean

nil
;;=> nil
;; nil is not a boolean. Represents "nothing"
;; nil evaluates to false in conditionals
