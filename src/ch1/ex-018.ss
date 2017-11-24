(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (iter-* a b) (imp a b 0))

(define (imp a b n)
  (cond
    ((= b 0) n)
    ((odd? b) (imp a (- b 1) (+ n a)))
    (else (imp (double a) (halve b) n))))

(define (odd? x) (= 1 (remainder x 2)))

(pretty-print (iter-* 101 99))
