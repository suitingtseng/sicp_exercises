(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(printf "(((double (double double)) inc) 5) = ~f\n" (((double (double double)) inc) 5))
