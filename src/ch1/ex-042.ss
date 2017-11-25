(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

(define (inc x) (+ x 1))

(printf "((compose square inc) 6) = ~f\n" ((compose square inc) 6))
