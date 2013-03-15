clisp notes
==============
quick lisp
-------------
(ql:quickload "vecto")


load and into a package
---------------
[25]> (defpackage #:abc (:use #:alexandria))
#<PACKAGE ABC>
[26]> (in-package #:abc)

(use-package 'alexandria)

*PACKAGE*
    current package name

(package-name *PACKAGE*)



True or not
-------------

     (atom '())
        T
     (atom ())
        T
      (null ())
        T
      (null '())
        T
common function
----------------
(cons S-expr list)

assignment
-----------
(setq)
(psetq)
(set)   
    almost the same as setq, except that it evaluates its
    first argument and the value of this first argument must be 
    an atom

Functions
-----------
(defun funcation-name parmeter-list commands)

Conditionals
--------------
(cond (cond1 command1)
      (cond2 command2)
      ....
      (             ))

(if condtion then-part [else-part])


