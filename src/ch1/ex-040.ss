(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* x x a)
       (* x b)
       c)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
 (define (close-enough? v1 v2)
   (< (abs (- v1 v2)) tolerance))
 (define (try guess)
   (let ((next (f guess)))
     (if (close-enough? guess next)
         next
         (try next))))
 (try first-guess))


(printf "x^3 + ~fx^2 + ~fx + ~f = 0; x = ~f\n"
        3 3 1 (newtons-method (cubic 3 3 1) 0))
