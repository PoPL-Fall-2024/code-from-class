(ns code-from-class.oral-exam-grading
  (:require clojure.string))

(def grade-values
  {\A 95
   \B 85
   \C 75
   \D 65
   \F 55})

(defn average
  "Returns float of average of list nums"
  [nums]
  (float (/ (apply + nums)
            (count nums))))

(defn letter-scores-to-number-grade
  "Given a string containing letter scores, such
   as 'ABBACA', convert each to a number and average."
  [scores]
  (average
   (map grade-values
        (clojure.string/upper-case scores))))

(defn avg-all-parts
  [& parts]
  (average (map letter-scores-to-number-grade parts)))

(defn numeric-grade-to-letter
  "Given a numeric grade, returns a string of the letter
   grade, such as B+"
  [numeric-grade]
  (let [letter (cond
                 (>= numeric-grade 90) "A"
                 (>= numeric-grade 80) "B"
                 (>= numeric-grade 70) "C"
                 (>= numeric-grade 60) "D"
                 :else "F")
        extra (cond
                (>= (mod numeric-grade 10) 7) "+"
                (>= (mod numeric-grade 10) 3) ""
                :else "-")]
    (str letter
         (when (not= letter "F")
           extra))))


(comment

  (let [grade-strings ["adbacc" "baacca"]
        num-grade (apply avg-all-parts grade-strings)
        letter-grade (numeric-grade-to-letter num-grade)]
    [num-grade letter-grade])
  ;;=> [84.166664 "B"]
  )