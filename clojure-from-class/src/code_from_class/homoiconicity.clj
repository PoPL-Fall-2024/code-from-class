(ns code-from-class.homoiconicity)

;; read-string
;; returns the data structure represented by the string

(read-string "(+ 2 3)")
;;=> (+ 2 3)

(type (read-string "(+ 2 3)"))
;;=> clojure.lang.PersistentList

(read-string "[1 2 7]")
;;=> [1 2 7]

;; Expands "reader macros" into their actual forms
(read-string "(quote (2 3 4))")
;;=> '(2 3 4)

(read-string "'(2 3 4)")
;;=> '(2 3 4)

(read-string "#(+ % %)")
;;=> (fn* [p1__9948#] (+ p1__9948# p1__9948#))

(read-string "hello")
;;=> hello

(type (read-string "hello"))
;;=> clojure.lang.Symbol

(read-string "(+ 2 3) ; this is a comment")
;;=> (+ 2 3)


; eval

(eval 5)
;;=> 5

(let [x 45]
  (eval x))
;;=> 45

;; (eval x)
;;=> Syntax error compiling at (src/code_from_class/homoiconicity.clj:44:1).
;;   Unable to resolve symbol: x in this context
;;   

'(+ 3 2)
;;=> (+ 3 2)

(eval '(+ 3 2))
;;=> 5

;; this shouldn't evaluate this as a function because it is quoted
(eval (read-string "'(+ 3 2)"))
;;=> (+ 3 2)

(eval (eval (read-string "'(+ 3 2)")))
;;=> 5

''(+ 3 2)
;;=> '(+ 3 2)

(eval (eval (read-string "''(+ 3 2)")))
;;=> (+ 3 2)

(quote (quote (+ 3 2)))
;;=> '(+ 3 2)

;; Write our own REPL

;; read-line - reads a line from std input:
;; (read-line)
;;=> "hi there"


(defn repl
  "A Clojure REPL."
  []
  (print "H]=> ")
  (flush)
  (let [line (read-line)]
    (when (not (empty? line))
      (println (eval (read-string line)))
      (recur))))

;; (repl)

(defn main
  "Called from the command line with:
   clj -X code-from-class.homoiconicity/main"
  [& args]
  (repl))

