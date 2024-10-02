(ns code-from-class.data-types)

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

; comparisons
(< 1 4)
;;=> true

(= 3 9)
;;=> false

(< 2 4 8 10)
;;=> true

(< 2 4 3 10)
;;=> false

;; Keywords
;; always evaluate to themselves
;; like symbols in Ruby
:kiwis
;;=> :kiwis

:avocados
;;=> :avocados

(= :kiwis :avocados)
;;=> false

(= :kiwis :kiwis)
;;=> true

; strings
; always use double quotes; can go on multiple lines
"hi there"
;;=> "hi there"

"This string
crosses
multiple lines"
;;=> "This string\ncrosses\nmultiple lines"

(println "This string
crosses
multiple lines")
;;=> nil

; str function converts all arguments to strings and concatenates

(str "Hello" "World")
;;=> "HelloWorld"

(str "hi" (+ 3 2))
;;=> "hi5"

; characters
\k
;;=> \k

\3
;;=> \3

\$
;;=> \$

\newline
;;=> \newline

\space
;;=> \space

;; \rawdhaw
;;=> Syntax error reading source at (REPL:137:1).
;;   Unsupported character: \rawdhaw
;;   

; symbols
; sort of like keywords, except they can be used to bind
; names to values
; we can get just a symbol by putting a single quote ' before it

'dog
;;=> dog

; def binds a value to a name/symbol. When you evaluate
; that symbol its value is returned
(def dog 5)
;;=> #'code-from-class.data-types/dog

dog
;;=> 5

'dog
;;=> dog

'+
;;=> +

+
;;=> #function[clojure.core/+]

(+ 2 5)
;;=> 7

'llama
;;=> llama

llama
;;=> Syntax error compiling at (src/code_from_class/data_types.clj:0:0).
;;   Unable to resolve symbol: llama in this context
;;   

(list 'dog 'llama :kiwi)
;;=> (dog llama :kiwi)

;; let's look at types:

(type 'dog)
;;=> clojure.lang.Symbol

(type :dog)
;;=> clojure.lang.Keyword

(type "dog")
;;=> java.lang.String

(type dog)
;;=> java.lang.Long

(type llama)
;;=> Syntax error compiling at (src/code_from_class/data_types.clj:195:1).
;;   Unable to resolve symbol: llama in this context
;;   

(type '+)
;;=> clojure.lang.Symbol

(type +)
;;=> clojure.core$_PLUS_

(type -)
;;=> clojure.core$_

(type type)
;;=> clojure.core$type

(type \+)
;;=> java.lang.Character

;; println - prints things with spaces between them
(println "llama")
;;=> nil

(println "Why" "do" \u "have" 5 "llamas?")
;;=> nil
