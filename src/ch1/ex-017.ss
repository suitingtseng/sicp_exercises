(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (odd? x) (= 1 (remainder x 2)))

(define (recur-* a b)
  (cond
    ((= b 1) a)
    ((odd? b) (+ a (recur-* a (- b 1))))
    (else (recur-* (double a) (halve b)))))


(pretty-print (recur-* 101 99))
