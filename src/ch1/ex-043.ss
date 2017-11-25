(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

(define (repeated f n)
  (lambda (x)
    (if (= n 0)
        x
        ((repeated f (- n 1)) (f x)))))



(printf "((repeated square 2) 5) = ~f\n" ((repeated square 2) 5))
(printf "((repeated square 4) 2) = ~f\n" ((repeated square 4) 2))
