;; (class System/getProperties)(def myString ""

Clojure basics

* Collection
All of them are immutable, heterogeneous and persistent.
** List 
Lists are ordered collections of items. They are ideal when new items will be added to or removed from the front (constant-time). They are not efficient (linear time) for finding items by index (using nth) and there is no efficient way to change items by index.

** Vectors

Vectors are also ordered collections of items. They are ideal
 when new items will be added to or removed from the back
 (constant-time). This means that using conj is more efficient
 than cons for adding items. They are efficient (constant time)
 for finding (using nth) or changing (using assoc) items by index. 
Function definitions specify their parameter list using a vector.
* Why?
(= [1 5 9 13 17 21 25 29 33 37] '(1 5 9 13 17 21 25 29 33 37))
* finally understand how to start the clujure in windows.<2012-05-02 Wed>
(fn [val keys] ((zipmap keys (repeat val) )))
#(zipmap %2 (repeat %))
; A loop that sums the numbers 10 + 9 + 8 + ...

; Set initial values count (cnt) from 10 and down

# need more about the recur
(#(loop [times %2 left %]
    (if (= times 1) 
        (first left)
	(recur (next left) (dec times)))) [1 2 3] 1)
# the order must be consistant.
#(loop [times %2 left %]
    (if (> times 0) 
      (recur (dec times)(next left))
      (first left)))
   
(defn my-max
  ([x] x)
  ([x y] (if (> x y) x y))
  ([x y & more] (reduce my-max (my-max x y) more)))


(fn (coll nth)

 (if (next s)
          (recur (next s))
          (first s))))


(defn max
  ([x] x)
  ([x y] ( (max x y))
  ([x y & more]
   (reduce1 max (max x y) more)))



  (defn my-nth [coll pos ](loop [left coll times pos]
    (if (> times 0) 
      (first left)
      (recur (next left) (dec times))
      )))

  (fn [colls]
    (loop [count 0 left colls]
      (if (empty? left)
	count
	(recur (inc count) (rest left)))))

 (+ (apply + (filter #(= 0  (rem % 3)) (range 1 1001))) (apply +  (filter #(= 0  (rem % 5)) (range 1 1001))))Clojure

** Sequences
Examples of functions and macros that return lazy sequences include: 

cache-seq, concat, cycle, distinct, drop, drop-last, drop-while, filter, for, interleave, interpose, iterate, lazy-cat, lazy-seq, line-seq, map, partition, range, re-seq, remove, repeat, replicate, take, take-nth, take-while and tree-seq.
