(define (iterative-improve good-enough improve)
  (define (iter guess)
    (if (good-enough guess)
        guess
        (iter (improve guess))))
  iter)

(define tolerance 0.00001)

(define (average x y) (/ (+ x y) 2.0))

(define (sqrt x)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  ((iterative-improve
     (lambda (guess) (close-enough? x (* guess guess)))
     (lambda (guess) (average guess (/ x guess))))
    1.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  ((iterative-improve
     (lambda (guess) (close-enough? guess (f guess)))
     f)
    first-guess))

(define (sqrt-fixed-point x)
  (fixed-point
    (lambda (y) (average y (/ x y)))
    1.0))

(printf "(sqrt 15) = ~f\n" (sqrt 15))
(printf "(sqrt-fixed-point 25) = ~f\n (sqrt-fixed-point 25))
