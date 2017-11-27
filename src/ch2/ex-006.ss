; zero is a procedure which returns a identity function.
(define zero (lambda (f) (lambda (x) x)))

; add-1
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (g) (lambda (x) (g x))))

(define two (lambda (h) (lambda (x) (h (h x)))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x))))
