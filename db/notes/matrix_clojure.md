
```{clojure}
user=> (use 'clojure.core.matrix)
nil
user=> (use 'clojure.core.matrix.operators) 
WARNING: - already refers to: #'clojure.core/- in namespace: user, being replaced by: #'clojure.core.matrix.operators/-
WARNING: * already refers to: #'clojure.core/* in namespace: user, being replaced by: #'clojure.core.matrix.operators/*
WARNING: + already refers to: #'clojure.core/+ in namespace: user, being replaced by: #'clojure.core.matrix.operators/+
nil
user=> (+ 1 2)
3
user=> (+ [1 2] [ 3 4])
[4 6]
user=> (normalise
normalise    normalise!   
user=> (normalise [3 4 5])
[0.4242640687119285 0.565685424949238 0.7071067811865475]
user=> (* [[2 0] [ 0 2]] [1 2])
[2 4]
user=> (sin 1)
0.8414709848078965
user=> (sin [1 2 3 4])
[0.8414709848078965 0.9092974268256817 0.1411200080598672 -0.7568024953079282]
user=> 



