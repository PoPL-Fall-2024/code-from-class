(ns code-from-class.debugging)

;;;;;;;;;;; We'll try some debugging using this problem:
;; Given a vector of integers and a target integer, return the two elements that
;; sum to the target integer. If none do, return nil.

(defn two-sum
  [ints target]
  (loop [numbers ints]
    (let [intA (first numbers)
          intB (- target intA)]
      ;; is intB in the list numbers?
      (if (contains? numbers intB)
        [intA intB]
        (recur (rest numbers))))))

(two-sum '(5 12 40 3 19 17 65 4 49)
         57)
;;=> Execution error (IllegalArgumentException) at code-from-class.debugging/two-sum (REPL:13).
;;   contains? not supported on type: clojure.lang.PersistentList
;;   

(defn seq-contains?
  [coll element]
  (some #(= % element) coll))

(seq-contains? '(5 9 22 37 6) 22)
;;=> true

(seq-contains? '(5 9 22 37 6) 86)
;;=> nil

(defn two-sum-debug1
  [ints target]
  (loop [numbers ints]
    (println "Numbers:" numbers)
    (let [intA (first numbers)
          ignore (println "intA: " intA ", target:" target)
          intB (- target intA)]
      ;; is intB in the list numbers?
      (if (seq-contains? numbers intB)
        [intA intB]
        (recur (rest numbers))))))

(two-sum-debug1 '(5 12 40 3 19 17 65 4 49)
                57)
;;=> [40 17]

(two-sum-debug1 '(5 12 40 3 19 17 65 4 49)
                0)
;;=> Execution error (NullPointerException) at code-from-class.debugging/two-sum-debug1 (REPL:39).
;;   null
;;   

(- 0 nil)
;;=> Execution error (NullPointerException) at code-from-class.debugging/eval9012 (REPL:55).
;;   null
;;   


(defn two-sum-debug2
  [ints target]
  (loop [numbers ints]
    (if (empty? numbers)
      nil
      (let [intA (first numbers)
            intB (- target intA)]
      ;; is intB in the list numbers?
        (if (seq-contains? numbers intB)
          [intA intB]
          (recur (rest numbers)))))))


(two-sum-debug2 '(5 12 40 3 19 17 65 4 49)
                57)
;;=> [40 17]

(two-sum-debug2 '(5 12 40 3 19 17 65 4 49)
                0)
;;=> nil