several ways to write fibs in perl6
=============================

```perl
@fibs1 := 1, 1, -> $a, $b { $a + $b } ... * ;
@fibs2 := 1, 1, {$^a + $^b } ... * ;
@fibs3 := 1, 1, * + * ... * ;
@fibs4 := 1, 1, &[+] ... *;
```
