(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (midpoint-segment s)
  (define (avg a b) (/ (+ a b) 2.0))
  (make-point (avg (x-point (start-segment s))
                   (x-point (end-segment s)))
              (avg (y-point (start-segment s))
                   (y-point (end-segment s)))))

(print-point (midpoint-segment (make-segment (make-point 10 5) (make-point 5 3))))
