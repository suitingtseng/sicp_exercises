(pretty-print 10)
(pretty-print (+ 5 3 4))
(pretty-print (- 9 1))
(pretty-print (/ 6 2))
(pretty-print (+ (* 2 4) (- 4 6)))
(define a 3)
(define b (+ a 1))
(pretty-print (+ a b (* a b)))
(pretty-print (= a b))
(pretty-print
 (if (and (> b a) (< b (* a b)))
   b
   a)
 )
(pretty-print
 (cond
   ((= a 4) 6)
   ((= b 4) (+ 6 7 a))
   (else 25))
 )
(pretty-print
 (+ 2
    (if (> b a)
      b
      a)
    )
 )
(pretty-print
 (*
  (cond
    ((> a b) a)
    ((< a b) b)
    (else -1)
    )
  (+ a 1)
  )
 )
