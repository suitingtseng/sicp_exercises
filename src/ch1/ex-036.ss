(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (printf "~f\n" guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-damping f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (average x y) (/ (+ x y) 2))
  (define (try guess)
    (printf "~f\n" guess)
    (let ((next (average guess (f guess))))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(printf "x^x = 1000, x = ~f (without damping)\n" (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))
(printf "x^x = 1000, x = ~f (with damping)\n" (fixed-point-damping (lambda (x) (/ (log 1000) (log x))) 2))
