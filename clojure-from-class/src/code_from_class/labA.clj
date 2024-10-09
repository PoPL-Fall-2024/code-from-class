(ns code-from-class.labA
  (:require clojure.string))

; Write a function that moves the last element of a list to the front of the list. 
(defn last-to-front
  [lst]
  (conj (butlast lst)
        (last lst)))

(last-to-front '(1 2 3 4 5))
;;=> (5 1 2 3 4)


; Write a function that takes an integer and returns every single digit of that integer
(defn to-digits
  [n]
  (map #(parse-long (str %))
       (str n)))


(to-digits 48913)
;;=> (4 8 9 1 3)

; Given a string, find the most common character in the string

; NOTE: The frequencies function returns a map of elements to their frequencies
(frequencies "hello classthisis alab thatwe areworkingon")
;;=> {\space 4, \a 5, \b 1, \c 1, \e 3, \g 1, \h 3, \i 3, \k 1, \l 4, \n 2, \o 3, \r 2, \s 4, \t 3, \w 2}

(defn most-common-char
  [string]
  (let [freqs (frequencies string)]
    (first (apply max-key second freqs))))

(most-common-char "hello classthisis alab thatwe areworkingon")
;;=> \a

; Take a given map of the words in a text + their frequencies with the formatting
; {word frequency}, return a list of all the words that are longer than 5
; characters and exist more than 3 times in the text.

(def sentence "the dog and the elephant went to the elephant zoo and saw the
elephant and its elephant mother and father. the elephant mother liked the dog
and the dog like the mother and the father. But, the father did not like the dog,
even though the mother did.")

; Just to see how frequencies and split work
(frequencies (clojure.string/split sentence #"\s"))
;;=> {"went" 1,
;;    "dog" 3,
;;    "not" 1,
;;    "father" 1,
;;    "like" 2,
;;    "But," 1,
;;    "dog," 1,
;;    "mother" 4,
;;    "its" 1,
;;    "father." 2,
;;    "liked" 1,
;;    "did" 1,
;;    "even" 1,
;;    "did." 1,
;;    "saw" 1,
;;    "and" 6,
;;    "elephant" 5,
;;    "to" 1,
;;    "zoo" 1,
;;    "the" 12,
;;    "though" 1}

(defn long-and-frequent
  [freqs]
  (map first
       (filter (fn [[key val]]
                 (and (> (count key) 5)
                      (> val 3)))
               freqs)))

(long-and-frequent (frequencies (clojure.string/split sentence #" ")))
;;=> ("mother" "elephant")


; Write a program that when given a text string, counts the number of repetitions
; of the letter 'a' in it, and returns that number.
(defn repetitions-of-a
  [string]
  (get (frequencies string) \a))

(repetitions-of-a "hamilton college sits on a tall hill")
;;=> 3


; Given a list of strings, write a function that returns if the strings are sorted by length.
(defn sorted-by-length?
  [words]
  (apply <
         (map count words)))

(sorted-by-length? '("a" "long" "longer" "list of words"))
;;=> true


; The function should take a word and find the index of each letter in the alphabet. 
; Sum the indices if the sum < 26 concatenate "too small" to the word, and repeat until
; the sum > 26 else return sum ^ 2. 
(defn letter-index
  [letter]
  (inc
   (- (int letter)
      (int \a))))

(int \a)
;;=> 97

(int \c)
;;=> 99

(letter-index \a)
;;=> 1

(letter-index \z)
;;=> 26

(defn sum-letter-indices
  [word]
  (apply +
         (map letter-index word)))

(sum-letter-indices "cat")
;;=> 24

(sum-letter-indices "hamilton")
;;=> 92

; NOTE: We haven't seen recursion yet, so you wouldn't be expected to do the next part
(defn sum-until-past-26
  [word]
  (let [sum (sum-letter-indices word)]
    (if (< sum 26)
      (recur (str word "toosmall"))
      (* sum sum))))

(sum-until-past-26 "cat")
;;=> 17161

(sum-until-past-26 "hamilton")
;;=> 8464


; Take a list of integers and only return the ones that end/or are a five 
; Ex: input (2 5 17 85 9 1115), output (5 85 1115)
(defn end-in-5
  [nums]
  (filter #(= 5 (mod % 10))
          nums))
;;=> #'code-from-class.labA/end-in-5

(end-in-5 '(2 5 17 85 9 1115))
;;=> (5 85 1115)


; Write a function, even_ize, that takes a list of integers and returns a list
; where all odd numbers have been doubled.
(defn even-ize
  [integers]
  (map (fn [n]
         (if (odd? n)
           (* 2 n)
           n))
       integers))

(even-ize '(2 6 304 5 9 101 10 11))
;;=> (2 6 304 10 18 202 10 22)


; A function which returns all prime numbers up to some integer

(defn prime?
  [x]
  (if (< x 2)
    false
    (= 2
       (count (filter #(zero? (mod x %))
                      (range 1 (inc x)))))))

(defn primes-up-to-n
  [n]
  (filter prime?
          (range (inc n))))

(primes-up-to-n 100)
;;=> (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)


; Write a function that takes a list of numbers and determines if all the numbers are prime.
; If they are, it returns the list. If not it returns the first composite number.
(defn all-prime-or-first-composite
  [integers]
  (let [composite (filter #(not (prime? %)) integers)]
    (if (empty? composite)
      integers
      (first composite))))

(all-prime-or-first-composite '(7 29 17))
;;=> (7 29 17)

(all-prime-or-first-composite '(7 29 28 17 33 5 12))
;;=> 28


; Take in a list of numbers and return a list of all the prime numbers in that list.
(defn all-primes-in-list
  [integers]
  (filter prime? integers))


(all-primes-in-list '(7 29 28 17 33 5 12))
;;=> (7 29 17 5)


; A function that takes an integer and returns a list of all its factors
(defn factors
  [n]
  (filter #(zero? (mod n %))
          (range 1 (inc n))))

(factors 60)
;;=> (1 2 3 4 5 6 10 12 15 20 30 60)


; Write a function that arranges a given list of vectors by the number of elements
; from greatest to least.
(defn sort-by-length-descending
  [vectors]
  (sort-by count vectors))

(sort-by-length-descending '([:a :b :c]
                             [1 2 3 4 5 6 7]
                             ["hello"]
                             [2.3 5.21 0.631 4.23 2.444444]
                             [true false]))
;;=> (["hello"] [true false] [:a :b :c] [2.3 5.21 0.631 4.23 2.444444] [1 2 3 4 5 6 7])


; write a function that takes a list of strings and sorts it by each string's length
; NOTE: it turns out we can just use the sort-by-length-descending function for this!
;       polymorphism FTW!

(sort-by-length-descending '("hello" "mountain" "mud" "frankenstein" "as"))
;;=> ("as" "mud" "hello" "mountain" "frankenstein")


; take a list of strings and return a list of their lengths, or take a list of
; strings then return a string where the strings in the original list are randomized.
(defn string-lengths
  [strings]
  (map count strings))

(string-lengths '("hello" "cat" "banana" "stompyness"))
;;=> (5 3 6 10)

(defn random-string-concat
  [strings]
  (apply str
         (shuffle strings)))

(random-string-concat '("hello" "cat" "banana" "stompyness"))
;;=> "catstompynesshellobanana"
;;=> "stompynesscathellobanana"
;;=> "bananahellostompynesscat"


; A function that takes a string and returns a list of vowels in that string.
; If a vowel appears more than once in the string, it would still only appear
; once in the list.

; NOTE: contains? takes a set and an element, and tells if the element is in
; the set. It does **NOT** work on a list/vector instead of a set.
(contains? #{\a \e \i} \e)
;;=> true

(contains? #{\a \e \i} \s)
;;=> false

(contains? [\a \e \i] \e) ;; this looks like it should be true, but isn't
;;=> false

(defn count-distinct-vowels
  [string]
  (count (filter #(contains? #{\a \e \i \o \u \y} %)
                 (distinct string))))

(count-distinct-vowels "hello there nice world!")
;;=> 3


; take a list and return a list of all the values above the mean
(defn mean
  [nums]
  (/ (apply + nums)
     (count nums)))

(mean '(5 8 10 2 12 13))
;;=> 25/3

(defn values-above-mean
  [nums]
  (let [mn (mean nums)]
    (filter #(< mn %)
            nums)))

(values-above-mean '(5 8 10 2 12 13))
;;=> (10 12 13)


; Write a function that takes a list of integers and returns the largest even 
; number from the list.
(defn largest-even
  [nums]
  (apply max (filter even? nums)))

(largest-even '(48 54 22 29 95 48 76 9 1 4 83 24))
;;=> 76


; Write a Clojure function called sum-even-numbers that takes a list of integers
; and returns the sum of all even numbers in the list
(defn sum-even-numbers
  [nums]
  (apply + (filter even? nums)))

(sum-even-numbers '(48 54 22 29 95 48 76 9 1 4 83 24))
;;=> 276


;; ------------------------------------------------------------------------
;; -------- NOTE: I don't think you could easily do any of the following with
;; --------       what you know now. Here's how I would do them

; Write a function that takes a list of integers and returns each element multiplied
; to the power of the next element

;; NOTE: map can take multiple sequences, and a function that takes that number
;; of args!
(defn power-of-next
  [nums]
  (map (fn [x y]
         (int (Math/pow x y)))
       nums
       (rest nums)))

(power-of-next '(2 5 3 3 6 2 1))
;;=> (32 125 27 729 36 2)


; Filter a list (maybe using an anonymous function?) where the condition is if a
; number is part of the fibonacci sequence 

;; NOTE: uses recursion (we have't seen yet)
(defn nth-fibonacci-number
  [n]
  (loop [n n
         x 0
         y 1]
    (if (<= n 0)
      x
      (recur (dec n)
             y
             (+' x y)))))

;; NOTE: uses an infinite sequence (we have't seen yet)
(def fibonacci-sequence (map nth-fibonacci-number (range)))

(take 10 fibonacci-sequence)
;;=> (0 1 1 2 3 5 8 13 21 34)

(defn is-in-fib-sequence?
  [n]
  (= n
     (last (take-while #(<= % n) fibonacci-sequence))))

(is-in-fib-sequence? 21)
;;=> true

(is-in-fib-sequence? 22)
;;=> false

(defn only-fib-numbers
  [sequence]
  (filter is-in-fib-sequence? sequence))

(only-fib-numbers '(34 32 8 1 9 2999 58 55))
;;=> (34 8 1 55)


; Get a function that takes a list of numbers and checks if it is a fibonacci sequence.
; NOTE: I'm interpreting this as being the first n numbers of the fib sequence
(defn is-start-of-fib-sequence
  [numbers]
  (= numbers
     (take (count numbers) fibonacci-sequence)))

(is-start-of-fib-sequence '(0 1 1 2 3 5 8))
;;=> true

(is-start-of-fib-sequence '(0 1 1 2 3 20 5 8))
;;=> false

(is-start-of-fib-sequence '(0 1 1 2 3 5 8 13 21 34 55 89))
;;=> true
