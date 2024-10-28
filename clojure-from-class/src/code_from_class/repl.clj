(ns code-from-class.repl)

;; What does eval do?
;; two main things:
;; 1. Evaluates a data structure (code) and returns the result
;; 2. If it evaluates a special form like def or defn, it
;;    creates global bindings as a side effect.
;; Clojure keeps track of a global environment that is essentially
;; a map of symbols and their bindings.

;; We will write a function my-eval that does NOT use any mutable state.
;; We need to be able to do both things that eval does, without having
;; side effects on the global environment.

;; We will create a map to treat as the environment.
;; We will pass this environment to my-eval, and my-eval will return
;; the potentially updated environment along with the result of evaluating
;; the expression.

;; state - a map containing the environment and the return value
(comment
  ;; example state:
  {:environment {'x 5
                 'length 27.2
                 'numbers '(4 8 12)
                 'square (fn [y] (* y y))}
   :return 43}
  ;;=> {:environment {x 5, length 27.2, numbers (4 8 12), square #function[code-from-class.repl/eval10226/fn--10227]},
  ;;    :return 43}
  )

; We will implement:
; x 1. creating my-eval and calling it in repl
; x 2. integer literals
; x 3. +
; x 4. nested calls to +
; x 5. def
; 6. evaluated defed symbols

(defn my-eval
  "Evaluates expression in the environment contained in state, and returns
   the resulting state with the :return and :environment keys set.
    - state should be a map with an :environment key that stores all
      global bindings, and a :return key that stores the result of evaluation
    - expression is the Clojure expression given to the REPL"
  [state expression]
  (if (not (seq? expression))
    ;; THEN: not a function call
    ;; Check if symbol or something else
    (if (symbol? expression)
      ;; This handles getting a value bound to a symbol in the environment
      (assoc state :return (get (:environment state) expression))
      ;; This just returns the expression if it is a literal that
      ;; evaluates to itself
      (assoc state :return expression))

    ;; ELSE: this is a function call
    (let [f (first expression)
          args (rest expression)
          env (:environment state)]

      ;; cond checks which function or special form
      (cond
        (= f '+) (assoc state :return (apply +
                                             (map #(:return (my-eval state %))
                                                  args)))
        
        (= f 'def) {:environment (assoc env
                                        (first args)
                                        (:return (my-eval state
                                                          (second args))))
                    :return (first args)}

        :else (assoc state :return "ERROR: That function is not defined.")))))


(defn repl
  "A Clojure REPL."
  ([] (repl {:environment {}
             :return nil}))
  ([state]
   (print "H]=> ")
   (flush)
   (let [line (read-line)]
     (when (not (empty? line))
       (let [new-state (my-eval state (read-string line))]
         (println "Environment:" (:environment new-state)) ;; comment out later
         (println (:return new-state))
         (recur new-state))))))

(defn main
  "Called from the command line with:
   clj -X code-from-class.repl/main"
  [& args]
  (repl))
