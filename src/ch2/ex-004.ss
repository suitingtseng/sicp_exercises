(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(printf "(cdr (cons 3 5)) = ~d\n" (cdr (cons 3 5)))
